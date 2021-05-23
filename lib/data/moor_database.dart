import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

part 'moor_database.g.dart';

class Players extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get number => integer()();
  IntColumn get score => integer()();
  // TODO: Fix spelling
  IntColumn get preferedPosition => integer()(); // 0 - defence, 1 - mid, 2 - attack
  TextColumn get name => text()();
  TextColumn get colour => text()(); // red, orange, green, blue, purple, pink
}

class PlayerPositions extends Table {
  IntColumn get playerId => integer().customConstraint('REFERENCES players(id)')();
  IntColumn get team => integer()();

  RealColumn get x => real()();
  RealColumn get y => real()();

  @override
  Set<Column> get primaryKey => {playerId};
}

class SaveSlots extends Table {
  IntColumn get playerId => integer().customConstraint('REFERENCES players(id)')();
  IntColumn get slot => integer()();
  IntColumn get team => integer()();

  RealColumn get x => real()();
  RealColumn get y => real()();

  @override
  Set<Column> get primaryKey => {slot, playerId};
}

class PlayerWithPosition {
  final Player player;
  final PlayerPosition position;

  PlayerWithPosition({required this.player, required this.position});
}

@UseMoor(tables: [Players, PlayerPositions, SaveSlots], daos: [PlayerDao, CurrentPlayerDao, SaveSlotDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(beforeOpen: (_) async => await customStatement('PRAGMA foreign_keys = ON'));
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final script = File(Platform.script.toFilePath());
    final databasePath = File('${script.parent.path}/db.sqlite');
    return VmDatabase(databasePath);
  });
}

@UseDao(tables: [Players])
class PlayerDao extends DatabaseAccessor<AppDatabase> with _$PlayerDaoMixin {
  final AppDatabase db;

  PlayerDao(this.db) : super(db);

  Future<List<Player>> getAllPlayers() => select(players).get();
  Stream<List<Player>> watchAllPlayers({bool sorted = true, String nameFilter = ''}) {
    var selected = select(players)..where((p) => p.name.like('%' + nameFilter + '%'));

    if (sorted) selected = selected..orderBy([(t) => OrderingTerm(expression: t.name.lower())]);
    return selected.watch();
  }

  Future<int> insertPlayer(Insertable<Player> player) => into(players).insert(player);
  Future updatePlayer(Insertable<Player> player) => update(players).replace(player);
  Future deletePlayer(Insertable<Player> player) => delete(players).delete(player);
  Future deletePlayerFromID(int id) => (delete(players)..where((p) => p.id.equals(id))).go();

  Future<Player> getPlayer(int id) => (select(players)..where((p) => p.id.equals(id))).getSingle();
}

@UseDao(tables: [PlayerPositions, Players])
class CurrentPlayerDao extends DatabaseAccessor<AppDatabase> with _$CurrentPlayerDaoMixin {
  final AppDatabase db;

  CurrentPlayerDao(this.db) : super(db);

  Stream<List<PlayerWithPosition>> watchPlayersOnTeam(int team) {
    return (select(playerPositions)..where((t) => t.team.equals(team)))
        .join(
          [
            leftOuterJoin(
              players,
              players.id.equalsExp(playerPositions.playerId),
            ),
          ],
        )
        .map(
          (row) => PlayerWithPosition(
            player: row.readTable(players),
            position: row.readTable(playerPositions),
          ),
        )
        .watch();
  }

  Future<List<PlayerWithPosition>> getAllPlayers() {
    return select(playerPositions)
        .join(
          [
            leftOuterJoin(
              players,
              players.id.equalsExp(playerPositions.playerId),
            ),
          ],
        )
        .map(
          (row) => PlayerWithPosition(
            player: row.readTable(players),
            position: row.readTable(playerPositions),
          ),
        )
        .get();
  }

  Future<List<PlayerWithPosition>> getPlayersOnTeam(int team) {
    return (select(playerPositions)..where((t) => t.team.equals(team)))
        .join(
          [
            leftOuterJoin(
              players,
              players.id.equalsExp(playerPositions.playerId),
            ),
          ],
        )
        .map(
          (row) => PlayerWithPosition(
            player: row.readTable(players),
            position: row.readTable(playerPositions),
          ),
        )
        .get();
  }

  Future insertPlayer(Insertable<PlayerPosition> playerPosition) => into(playerPositions).insert(playerPosition);
  Future updatePlayer(Insertable<PlayerPosition> playerPosition) =>
      update(playerPositions).replace(playerPosition); // TODO: Fix updating - problem because swapping players changes ID

  Future deletePlayer(Insertable<PlayerPosition> playerPosition) => delete(playerPositions).delete(playerPosition);
  Future deletePlayerFromID(int id) => (delete(playerPositions)..where((p) => p.playerId.equals(id))).go();

  Future removeAllPlayers() => delete(playerPositions).go();
}

@UseDao(tables: [PlayerPositions, SaveSlots, Players])
class SaveSlotDao extends DatabaseAccessor<AppDatabase> with _$SaveSlotDaoMixin {
  final AppDatabase db;

  SaveSlotDao(this.db) : super(db);

  Future saveFormation(int slot) async {
    final currentPlayers = await db.currentPlayerDao.getAllPlayers();
    for (final player in currentPlayers) {
      final saveSlot = SaveSlotsCompanion(
        playerId: Value(player.player.id),
        team: Value(player.position.team),
        x: Value(player.position.x),
        y: Value(player.position.y),
        slot: Value(slot),
      );

      into(saveSlots).insert(saveSlot, mode: InsertMode.insertOrReplace);
    }
  }

  Future<List<PlayerWithPosition>> loadSlot(int lot) => select(saveSlots)
      .join(
        [
          leftOuterJoin(
            players,
            players.id.equalsExp(saveSlots.playerId),
          ),
          leftOuterJoin(
            playerPositions,
            playerPositions.playerId.equalsExp(saveSlots.playerId),
          ),
        ],
      )
      .map(
        (row) => PlayerWithPosition(
          player: row.readTable(players),
          position: row.readTable(playerPositions),
        ),
      )
      .get();
}
