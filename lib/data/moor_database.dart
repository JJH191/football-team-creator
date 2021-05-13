import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';

part 'moor_database.g.dart';

class Players extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get number => integer()();
  IntColumn get score => integer()();
  IntColumn get preferedPosition => integer()(); // 0 - defence, 1 - mid, 2 - attack
  TextColumn get name => text()();
  TextColumn get colour => text()(); // red, orange, green, blue, purple, pink
}

class PlayerPositions extends Table {
  IntColumn get playerId => integer().customConstraint('REFERENCES players(id)')();

  RealColumn get x => real()();
  RealColumn get y => real()();

  @override
  Set<Column> get primaryKey => {playerId};
}

class PlayerWithPosition {
  final Player player;
  final PlayerPosition position;

  PlayerWithPosition({required this.player, required this.position});
}

@UseMoor(tables: [Players, PlayerPositions], daos: [PlayerDao, CurrentPlayerDao])
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
    final file = File('./db.sqlite');
    return VmDatabase(file);
  });
}

@UseDao(tables: [Players])
class PlayerDao extends DatabaseAccessor<AppDatabase> with _$PlayerDaoMixin {
  final AppDatabase db;

  PlayerDao(this.db) : super(db);

  Future<List<Player>> getAllPlayers() => select(players).get();
  Stream<List<Player>> watchAllPlayers({bool sorted = true}) {
    var selected = select(players);

    if (sorted) selected = selected..orderBy([(t) => OrderingTerm(expression: t.name)]);
    return selected.watch();
  }

  Future<int> insertPlayer(Insertable<Player> player) => into(players).insert(player);
  Future updatePlayer(Insertable<Player> player) => update(players).replace(player);
  Future deletePlayer(Insertable<Player> player) => delete(players).delete(player);
}

@UseDao(tables: [PlayerPositions, Players])
class CurrentPlayerDao extends DatabaseAccessor<AppDatabase> with _$CurrentPlayerDaoMixin {
  final AppDatabase db;

  CurrentPlayerDao(this.db) : super(db);

  Stream<List<PlayerWithPosition>> watchAllPlayers() => 
    select(playerPositions)
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

  Future insertPlayer(Insertable<PlayerPosition> playerPosition) => into(playerPositions).insert(playerPosition);
  Future updatePlayer(Insertable<PlayerPosition> playerPosition) => update(playerPositions).replace(playerPosition);
  Future deletePlayer(Insertable<PlayerPosition> playerPosition) => delete(playerPositions).delete(playerPosition);
}
