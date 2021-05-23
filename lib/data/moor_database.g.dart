// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Player extends DataClass implements Insertable<Player> {
  final int id;
  final int number;
  final int score;
  final int preferedPosition;
  final String name;
  final String colour;
  Player(
      {required this.id,
      required this.number,
      required this.score,
      required this.preferedPosition,
      required this.name,
      required this.colour});
  factory Player.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Player(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      number:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      score: intType.mapFromDatabaseResponse(data['${effectivePrefix}score'])!,
      preferedPosition: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}prefered_position'])!,
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      colour:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}colour'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number'] = Variable<int>(number);
    map['score'] = Variable<int>(score);
    map['prefered_position'] = Variable<int>(preferedPosition);
    map['name'] = Variable<String>(name);
    map['colour'] = Variable<String>(colour);
    return map;
  }

  PlayersCompanion toCompanion(bool nullToAbsent) {
    return PlayersCompanion(
      id: Value(id),
      number: Value(number),
      score: Value(score),
      preferedPosition: Value(preferedPosition),
      name: Value(name),
      colour: Value(colour),
    );
  }

  factory Player.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Player(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<int>(json['number']),
      score: serializer.fromJson<int>(json['score']),
      preferedPosition: serializer.fromJson<int>(json['preferedPosition']),
      name: serializer.fromJson<String>(json['name']),
      colour: serializer.fromJson<String>(json['colour']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<int>(number),
      'score': serializer.toJson<int>(score),
      'preferedPosition': serializer.toJson<int>(preferedPosition),
      'name': serializer.toJson<String>(name),
      'colour': serializer.toJson<String>(colour),
    };
  }

  Player copyWith(
          {int? id,
          int? number,
          int? score,
          int? preferedPosition,
          String? name,
          String? colour}) =>
      Player(
        id: id ?? this.id,
        number: number ?? this.number,
        score: score ?? this.score,
        preferedPosition: preferedPosition ?? this.preferedPosition,
        name: name ?? this.name,
        colour: colour ?? this.colour,
      );
  @override
  String toString() {
    return (StringBuffer('Player(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('score: $score, ')
          ..write('preferedPosition: $preferedPosition, ')
          ..write('name: $name, ')
          ..write('colour: $colour')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          number.hashCode,
          $mrjc(
              score.hashCode,
              $mrjc(preferedPosition.hashCode,
                  $mrjc(name.hashCode, colour.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Player &&
          other.id == this.id &&
          other.number == this.number &&
          other.score == this.score &&
          other.preferedPosition == this.preferedPosition &&
          other.name == this.name &&
          other.colour == this.colour);
}

class PlayersCompanion extends UpdateCompanion<Player> {
  final Value<int> id;
  final Value<int> number;
  final Value<int> score;
  final Value<int> preferedPosition;
  final Value<String> name;
  final Value<String> colour;
  const PlayersCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.score = const Value.absent(),
    this.preferedPosition = const Value.absent(),
    this.name = const Value.absent(),
    this.colour = const Value.absent(),
  });
  PlayersCompanion.insert({
    this.id = const Value.absent(),
    required int number,
    required int score,
    required int preferedPosition,
    required String name,
    required String colour,
  })  : number = Value(number),
        score = Value(score),
        preferedPosition = Value(preferedPosition),
        name = Value(name),
        colour = Value(colour);
  static Insertable<Player> custom({
    Expression<int>? id,
    Expression<int>? number,
    Expression<int>? score,
    Expression<int>? preferedPosition,
    Expression<String>? name,
    Expression<String>? colour,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (score != null) 'score': score,
      if (preferedPosition != null) 'prefered_position': preferedPosition,
      if (name != null) 'name': name,
      if (colour != null) 'colour': colour,
    });
  }

  PlayersCompanion copyWith(
      {Value<int>? id,
      Value<int>? number,
      Value<int>? score,
      Value<int>? preferedPosition,
      Value<String>? name,
      Value<String>? colour}) {
    return PlayersCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      score: score ?? this.score,
      preferedPosition: preferedPosition ?? this.preferedPosition,
      name: name ?? this.name,
      colour: colour ?? this.colour,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (preferedPosition.present) {
      map['prefered_position'] = Variable<int>(preferedPosition.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayersCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('score: $score, ')
          ..write('preferedPosition: $preferedPosition, ')
          ..write('name: $name, ')
          ..write('colour: $colour')
          ..write(')'))
        .toString();
  }
}

class $PlayersTable extends Players with TableInfo<$PlayersTable, Player> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlayersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedIntColumn number = _constructNumber();
  GeneratedIntColumn _constructNumber() {
    return GeneratedIntColumn(
      'number',
      $tableName,
      false,
    );
  }

  final VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedIntColumn score = _constructScore();
  GeneratedIntColumn _constructScore() {
    return GeneratedIntColumn(
      'score',
      $tableName,
      false,
    );
  }

  final VerificationMeta _preferedPositionMeta =
      const VerificationMeta('preferedPosition');
  @override
  late final GeneratedIntColumn preferedPosition = _constructPreferedPosition();
  GeneratedIntColumn _constructPreferedPosition() {
    return GeneratedIntColumn(
      'prefered_position',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedTextColumn name = _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedTextColumn colour = _constructColour();
  GeneratedTextColumn _constructColour() {
    return GeneratedTextColumn(
      'colour',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, number, score, preferedPosition, name, colour];
  @override
  $PlayersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'players';
  @override
  final String actualTableName = 'players';
  @override
  VerificationContext validateIntegrity(Insertable<Player> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('prefered_position')) {
      context.handle(
          _preferedPositionMeta,
          preferedPosition.isAcceptableOrUnknown(
              data['prefered_position']!, _preferedPositionMeta));
    } else if (isInserting) {
      context.missing(_preferedPositionMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('colour')) {
      context.handle(_colourMeta,
          colour.isAcceptableOrUnknown(data['colour']!, _colourMeta));
    } else if (isInserting) {
      context.missing(_colourMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Player map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Player.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PlayersTable createAlias(String alias) {
    return $PlayersTable(_db, alias);
  }
}

class PlayerPosition extends DataClass implements Insertable<PlayerPosition> {
  final int playerId;
  final int team;
  final double x;
  final double y;
  PlayerPosition(
      {required this.playerId,
      required this.team,
      required this.x,
      required this.y});
  factory PlayerPosition.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return PlayerPosition(
      playerId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}player_id'])!,
      team: intType.mapFromDatabaseResponse(data['${effectivePrefix}team'])!,
      x: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}x'])!,
      y: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}y'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['player_id'] = Variable<int>(playerId);
    map['team'] = Variable<int>(team);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    return map;
  }

  PlayerPositionsCompanion toCompanion(bool nullToAbsent) {
    return PlayerPositionsCompanion(
      playerId: Value(playerId),
      team: Value(team),
      x: Value(x),
      y: Value(y),
    );
  }

  factory PlayerPosition.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PlayerPosition(
      playerId: serializer.fromJson<int>(json['playerId']),
      team: serializer.fromJson<int>(json['team']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'playerId': serializer.toJson<int>(playerId),
      'team': serializer.toJson<int>(team),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
    };
  }

  PlayerPosition copyWith({int? playerId, int? team, double? x, double? y}) =>
      PlayerPosition(
        playerId: playerId ?? this.playerId,
        team: team ?? this.team,
        x: x ?? this.x,
        y: y ?? this.y,
      );
  @override
  String toString() {
    return (StringBuffer('PlayerPosition(')
          ..write('playerId: $playerId, ')
          ..write('team: $team, ')
          ..write('x: $x, ')
          ..write('y: $y')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      playerId.hashCode, $mrjc(team.hashCode, $mrjc(x.hashCode, y.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is PlayerPosition &&
          other.playerId == this.playerId &&
          other.team == this.team &&
          other.x == this.x &&
          other.y == this.y);
}

class PlayerPositionsCompanion extends UpdateCompanion<PlayerPosition> {
  final Value<int> playerId;
  final Value<int> team;
  final Value<double> x;
  final Value<double> y;
  const PlayerPositionsCompanion({
    this.playerId = const Value.absent(),
    this.team = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
  });
  PlayerPositionsCompanion.insert({
    this.playerId = const Value.absent(),
    required int team,
    required double x,
    required double y,
  })  : team = Value(team),
        x = Value(x),
        y = Value(y);
  static Insertable<PlayerPosition> custom({
    Expression<int>? playerId,
    Expression<int>? team,
    Expression<double>? x,
    Expression<double>? y,
  }) {
    return RawValuesInsertable({
      if (playerId != null) 'player_id': playerId,
      if (team != null) 'team': team,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
    });
  }

  PlayerPositionsCompanion copyWith(
      {Value<int>? playerId,
      Value<int>? team,
      Value<double>? x,
      Value<double>? y}) {
    return PlayerPositionsCompanion(
      playerId: playerId ?? this.playerId,
      team: team ?? this.team,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (playerId.present) {
      map['player_id'] = Variable<int>(playerId.value);
    }
    if (team.present) {
      map['team'] = Variable<int>(team.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerPositionsCompanion(')
          ..write('playerId: $playerId, ')
          ..write('team: $team, ')
          ..write('x: $x, ')
          ..write('y: $y')
          ..write(')'))
        .toString();
  }
}

class $PlayerPositionsTable extends PlayerPositions
    with TableInfo<$PlayerPositionsTable, PlayerPosition> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PlayerPositionsTable(this._db, [this._alias]);
  final VerificationMeta _playerIdMeta = const VerificationMeta('playerId');
  @override
  late final GeneratedIntColumn playerId = _constructPlayerId();
  GeneratedIntColumn _constructPlayerId() {
    return GeneratedIntColumn('player_id', $tableName, false,
        $customConstraints: 'REFERENCES players(id)');
  }

  final VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedIntColumn team = _constructTeam();
  GeneratedIntColumn _constructTeam() {
    return GeneratedIntColumn(
      'team',
      $tableName,
      false,
    );
  }

  final VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedRealColumn x = _constructX();
  GeneratedRealColumn _constructX() {
    return GeneratedRealColumn(
      'x',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedRealColumn y = _constructY();
  GeneratedRealColumn _constructY() {
    return GeneratedRealColumn(
      'y',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [playerId, team, x, y];
  @override
  $PlayerPositionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'player_positions';
  @override
  final String actualTableName = 'player_positions';
  @override
  VerificationContext validateIntegrity(Insertable<PlayerPosition> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('player_id')) {
      context.handle(_playerIdMeta,
          playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta));
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {playerId};
  @override
  PlayerPosition map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return PlayerPosition.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PlayerPositionsTable createAlias(String alias) {
    return $PlayerPositionsTable(_db, alias);
  }
}

class SaveSlot extends DataClass implements Insertable<SaveSlot> {
  final int playerId;
  final int slot;
  final int team;
  final double x;
  final double y;
  SaveSlot(
      {required this.playerId,
      required this.slot,
      required this.team,
      required this.x,
      required this.y});
  factory SaveSlot.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return SaveSlot(
      playerId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}player_id'])!,
      slot: intType.mapFromDatabaseResponse(data['${effectivePrefix}slot'])!,
      team: intType.mapFromDatabaseResponse(data['${effectivePrefix}team'])!,
      x: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}x'])!,
      y: doubleType.mapFromDatabaseResponse(data['${effectivePrefix}y'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['player_id'] = Variable<int>(playerId);
    map['slot'] = Variable<int>(slot);
    map['team'] = Variable<int>(team);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    return map;
  }

  SaveSlotsCompanion toCompanion(bool nullToAbsent) {
    return SaveSlotsCompanion(
      playerId: Value(playerId),
      slot: Value(slot),
      team: Value(team),
      x: Value(x),
      y: Value(y),
    );
  }

  factory SaveSlot.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SaveSlot(
      playerId: serializer.fromJson<int>(json['playerId']),
      slot: serializer.fromJson<int>(json['slot']),
      team: serializer.fromJson<int>(json['team']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'playerId': serializer.toJson<int>(playerId),
      'slot': serializer.toJson<int>(slot),
      'team': serializer.toJson<int>(team),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
    };
  }

  SaveSlot copyWith(
          {int? playerId, int? slot, int? team, double? x, double? y}) =>
      SaveSlot(
        playerId: playerId ?? this.playerId,
        slot: slot ?? this.slot,
        team: team ?? this.team,
        x: x ?? this.x,
        y: y ?? this.y,
      );
  @override
  String toString() {
    return (StringBuffer('SaveSlot(')
          ..write('playerId: $playerId, ')
          ..write('slot: $slot, ')
          ..write('team: $team, ')
          ..write('x: $x, ')
          ..write('y: $y')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      playerId.hashCode,
      $mrjc(
          slot.hashCode, $mrjc(team.hashCode, $mrjc(x.hashCode, y.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SaveSlot &&
          other.playerId == this.playerId &&
          other.slot == this.slot &&
          other.team == this.team &&
          other.x == this.x &&
          other.y == this.y);
}

class SaveSlotsCompanion extends UpdateCompanion<SaveSlot> {
  final Value<int> playerId;
  final Value<int> slot;
  final Value<int> team;
  final Value<double> x;
  final Value<double> y;
  const SaveSlotsCompanion({
    this.playerId = const Value.absent(),
    this.slot = const Value.absent(),
    this.team = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
  });
  SaveSlotsCompanion.insert({
    required int playerId,
    required int slot,
    required int team,
    required double x,
    required double y,
  })  : playerId = Value(playerId),
        slot = Value(slot),
        team = Value(team),
        x = Value(x),
        y = Value(y);
  static Insertable<SaveSlot> custom({
    Expression<int>? playerId,
    Expression<int>? slot,
    Expression<int>? team,
    Expression<double>? x,
    Expression<double>? y,
  }) {
    return RawValuesInsertable({
      if (playerId != null) 'player_id': playerId,
      if (slot != null) 'slot': slot,
      if (team != null) 'team': team,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
    });
  }

  SaveSlotsCompanion copyWith(
      {Value<int>? playerId,
      Value<int>? slot,
      Value<int>? team,
      Value<double>? x,
      Value<double>? y}) {
    return SaveSlotsCompanion(
      playerId: playerId ?? this.playerId,
      slot: slot ?? this.slot,
      team: team ?? this.team,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (playerId.present) {
      map['player_id'] = Variable<int>(playerId.value);
    }
    if (slot.present) {
      map['slot'] = Variable<int>(slot.value);
    }
    if (team.present) {
      map['team'] = Variable<int>(team.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaveSlotsCompanion(')
          ..write('playerId: $playerId, ')
          ..write('slot: $slot, ')
          ..write('team: $team, ')
          ..write('x: $x, ')
          ..write('y: $y')
          ..write(')'))
        .toString();
  }
}

class $SaveSlotsTable extends SaveSlots
    with TableInfo<$SaveSlotsTable, SaveSlot> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SaveSlotsTable(this._db, [this._alias]);
  final VerificationMeta _playerIdMeta = const VerificationMeta('playerId');
  @override
  late final GeneratedIntColumn playerId = _constructPlayerId();
  GeneratedIntColumn _constructPlayerId() {
    return GeneratedIntColumn('player_id', $tableName, false,
        $customConstraints: 'REFERENCES players(id)');
  }

  final VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedIntColumn slot = _constructSlot();
  GeneratedIntColumn _constructSlot() {
    return GeneratedIntColumn(
      'slot',
      $tableName,
      false,
    );
  }

  final VerificationMeta _teamMeta = const VerificationMeta('team');
  @override
  late final GeneratedIntColumn team = _constructTeam();
  GeneratedIntColumn _constructTeam() {
    return GeneratedIntColumn(
      'team',
      $tableName,
      false,
    );
  }

  final VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedRealColumn x = _constructX();
  GeneratedRealColumn _constructX() {
    return GeneratedRealColumn(
      'x',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedRealColumn y = _constructY();
  GeneratedRealColumn _constructY() {
    return GeneratedRealColumn(
      'y',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [playerId, slot, team, x, y];
  @override
  $SaveSlotsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'save_slots';
  @override
  final String actualTableName = 'save_slots';
  @override
  VerificationContext validateIntegrity(Insertable<SaveSlot> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('player_id')) {
      context.handle(_playerIdMeta,
          playerId.isAcceptableOrUnknown(data['player_id']!, _playerIdMeta));
    } else if (isInserting) {
      context.missing(_playerIdMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
          _slotMeta, slot.isAcceptableOrUnknown(data['slot']!, _slotMeta));
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('team')) {
      context.handle(
          _teamMeta, team.isAcceptableOrUnknown(data['team']!, _teamMeta));
    } else if (isInserting) {
      context.missing(_teamMeta);
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {slot, playerId};
  @override
  SaveSlot map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SaveSlot.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SaveSlotsTable createAlias(String alias) {
    return $SaveSlotsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PlayersTable players = $PlayersTable(this);
  late final $PlayerPositionsTable playerPositions =
      $PlayerPositionsTable(this);
  late final $SaveSlotsTable saveSlots = $SaveSlotsTable(this);
  late final PlayerDao playerDao = PlayerDao(this as AppDatabase);
  late final CurrentPlayerDao currentPlayerDao =
      CurrentPlayerDao(this as AppDatabase);
  late final SaveSlotDao saveSlotDao = SaveSlotDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [players, playerPositions, saveSlots];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$PlayerDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlayersTable get players => attachedDatabase.players;
}
mixin _$CurrentPlayerDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlayerPositionsTable get playerPositions => attachedDatabase.playerPositions;
  $PlayersTable get players => attachedDatabase.players;
}
mixin _$SaveSlotDaoMixin on DatabaseAccessor<AppDatabase> {
  $PlayerPositionsTable get playerPositions => attachedDatabase.playerPositions;
  $SaveSlotsTable get saveSlots => attachedDatabase.saveSlots;
  $PlayersTable get players => attachedDatabase.players;
}
