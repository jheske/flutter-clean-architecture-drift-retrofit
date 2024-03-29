// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../app_database.dart';

// ignore_for_file: type=lint
class User extends Table with TableInfo<User, UserTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  User(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _musicStyleMeta =
      const VerificationMeta('musicStyle');
  late final GeneratedColumn<String> musicStyle = GeneratedColumn<String>(
      'music_style', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _favoriteSongNameMeta =
      const VerificationMeta('favoriteSongName');
  late final GeneratedColumn<String> favoriteSongName = GeneratedColumn<String>(
      'favorite_song_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, musicStyle, favoriteSongName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'User';
  @override
  VerificationContext validateIntegrity(Insertable<UserTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('music_style')) {
      context.handle(
          _musicStyleMeta,
          musicStyle.isAcceptableOrUnknown(
              data['music_style']!, _musicStyleMeta));
    } else if (isInserting) {
      context.missing(_musicStyleMeta);
    }
    if (data.containsKey('favorite_song_name')) {
      context.handle(
          _favoriteSongNameMeta,
          favoriteSongName.isAcceptableOrUnknown(
              data['favorite_song_name']!, _favoriteSongNameMeta));
    } else if (isInserting) {
      context.missing(_favoriteSongNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      musicStyle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}music_style'])!,
      favoriteSongName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}favorite_song_name'])!,
    );
  }

  @override
  User createAlias(String alias) {
    return User(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class UserTable extends DataClass implements Insertable<UserTable> {
  final int id;
  final String username;
  final String musicStyle;
  final String favoriteSongName;
  const UserTable(
      {required this.id,
      required this.username,
      required this.musicStyle,
      required this.favoriteSongName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['music_style'] = Variable<String>(musicStyle);
    map['favorite_song_name'] = Variable<String>(favoriteSongName);
    return map;
  }

  UserCompanion toCompanion(bool nullToAbsent) {
    return UserCompanion(
      id: Value(id),
      username: Value(username),
      musicStyle: Value(musicStyle),
      favoriteSongName: Value(favoriteSongName),
    );
  }

  factory UserTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTable(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      musicStyle: serializer.fromJson<String>(json['music_style']),
      favoriteSongName: serializer.fromJson<String>(json['favorite_song_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'music_style': serializer.toJson<String>(musicStyle),
      'favorite_song_name': serializer.toJson<String>(favoriteSongName),
    };
  }

  UserTable copyWith(
          {int? id,
          String? username,
          String? musicStyle,
          String? favoriteSongName}) =>
      UserTable(
        id: id ?? this.id,
        username: username ?? this.username,
        musicStyle: musicStyle ?? this.musicStyle,
        favoriteSongName: favoriteSongName ?? this.favoriteSongName,
      );
  @override
  String toString() {
    return (StringBuffer('UserTable(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('favoriteSongName: $favoriteSongName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, musicStyle, favoriteSongName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTable &&
          other.id == this.id &&
          other.username == this.username &&
          other.musicStyle == this.musicStyle &&
          other.favoriteSongName == this.favoriteSongName);
}

class UserCompanion extends UpdateCompanion<UserTable> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> musicStyle;
  final Value<String> favoriteSongName;
  const UserCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.musicStyle = const Value.absent(),
    this.favoriteSongName = const Value.absent(),
  });
  UserCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String musicStyle,
    required String favoriteSongName,
  })  : username = Value(username),
        musicStyle = Value(musicStyle),
        favoriteSongName = Value(favoriteSongName);
  static Insertable<UserTable> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? musicStyle,
    Expression<String>? favoriteSongName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (musicStyle != null) 'music_style': musicStyle,
      if (favoriteSongName != null) 'favorite_song_name': favoriteSongName,
    });
  }

  UserCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? musicStyle,
      Value<String>? favoriteSongName}) {
    return UserCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      musicStyle: musicStyle ?? this.musicStyle,
      favoriteSongName: favoriteSongName ?? this.favoriteSongName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (musicStyle.present) {
      map['music_style'] = Variable<String>(musicStyle.value);
    }
    if (favoriteSongName.present) {
      map['favorite_song_name'] = Variable<String>(favoriteSongName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('favoriteSongName: $favoriteSongName')
          ..write(')'))
        .toString();
  }
}

class Artist extends Table with TableInfo<Artist, ArtistTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Artist(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _musicStyleMeta =
      const VerificationMeta('musicStyle');
  late final GeneratedColumn<String> musicStyle = GeneratedColumn<String>(
      'music_style', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  late final GeneratedColumn<int> isActive = GeneratedColumn<int>(
      'isActive', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'DEFAULT 0',
      defaultValue: const CustomExpression('0'));
  @override
  List<GeneratedColumn> get $columns => [id, name, age, musicStyle, isActive];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Artist';
  @override
  VerificationContext validateIntegrity(Insertable<ArtistTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('music_style')) {
      context.handle(
          _musicStyleMeta,
          musicStyle.isAcceptableOrUnknown(
              data['music_style']!, _musicStyleMeta));
    } else if (isInserting) {
      context.missing(_musicStyleMeta);
    }
    if (data.containsKey('isActive')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['isActive']!, _isActiveMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArtistTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArtistTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      musicStyle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}music_style'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}isActive']),
    );
  }

  @override
  Artist createAlias(String alias) {
    return Artist(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class ArtistTable extends DataClass implements Insertable<ArtistTable> {
  final int id;
  final String name;
  final int age;
  final String musicStyle;
  final int? isActive;
  const ArtistTable(
      {required this.id,
      required this.name,
      required this.age,
      required this.musicStyle,
      this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['music_style'] = Variable<String>(musicStyle);
    if (!nullToAbsent || isActive != null) {
      map['isActive'] = Variable<int>(isActive);
    }
    return map;
  }

  ArtistCompanion toCompanion(bool nullToAbsent) {
    return ArtistCompanion(
      id: Value(id),
      name: Value(name),
      age: Value(age),
      musicStyle: Value(musicStyle),
      isActive: isActive == null && nullToAbsent
          ? const Value.absent()
          : Value(isActive),
    );
  }

  factory ArtistTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArtistTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      musicStyle: serializer.fromJson<String>(json['music_style']),
      isActive: serializer.fromJson<int?>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'music_style': serializer.toJson<String>(musicStyle),
      'isActive': serializer.toJson<int?>(isActive),
    };
  }

  ArtistTable copyWith(
          {int? id,
          String? name,
          int? age,
          String? musicStyle,
          Value<int?> isActive = const Value.absent()}) =>
      ArtistTable(
        id: id ?? this.id,
        name: name ?? this.name,
        age: age ?? this.age,
        musicStyle: musicStyle ?? this.musicStyle,
        isActive: isActive.present ? isActive.value : this.isActive,
      );
  @override
  String toString() {
    return (StringBuffer('ArtistTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, age, musicStyle, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArtistTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.age == this.age &&
          other.musicStyle == this.musicStyle &&
          other.isActive == this.isActive);
}

class ArtistCompanion extends UpdateCompanion<ArtistTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> age;
  final Value<String> musicStyle;
  final Value<int?> isActive;
  const ArtistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.musicStyle = const Value.absent(),
    this.isActive = const Value.absent(),
  });
  ArtistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int age,
    required String musicStyle,
    this.isActive = const Value.absent(),
  })  : name = Value(name),
        age = Value(age),
        musicStyle = Value(musicStyle);
  static Insertable<ArtistTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? musicStyle,
    Expression<int>? isActive,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (musicStyle != null) 'music_style': musicStyle,
      if (isActive != null) 'isActive': isActive,
    });
  }

  ArtistCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? age,
      Value<String>? musicStyle,
      Value<int?>? isActive}) {
    return ArtistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      musicStyle: musicStyle ?? this.musicStyle,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (musicStyle.present) {
      map['music_style'] = Variable<String>(musicStyle.value);
    }
    if (isActive.present) {
      map['isActive'] = Variable<int>(isActive.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArtistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('musicStyle: $musicStyle, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }
}

class Song extends Table with TableInfo<Song, SongTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Song(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _artistIdMeta =
      const VerificationMeta('artistId');
  late final GeneratedColumn<int> artistId = GeneratedColumn<int>(
      'artist_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES Artist(id)ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [id, name, duration, artistId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Song';
  @override
  VerificationContext validateIntegrity(Insertable<SongTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('artist_id')) {
      context.handle(_artistIdMeta,
          artistId.isAcceptableOrUnknown(data['artist_id']!, _artistIdMeta));
    } else if (isInserting) {
      context.missing(_artistIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SongTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SongTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      artistId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}artist_id'])!,
    );
  }

  @override
  Song createAlias(String alias) {
    return Song(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class SongTable extends DataClass implements Insertable<SongTable> {
  final int id;
  final String name;
  final int duration;
  final int artistId;
  const SongTable(
      {required this.id,
      required this.name,
      required this.duration,
      required this.artistId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['duration'] = Variable<int>(duration);
    map['artist_id'] = Variable<int>(artistId);
    return map;
  }

  SongCompanion toCompanion(bool nullToAbsent) {
    return SongCompanion(
      id: Value(id),
      name: Value(name),
      duration: Value(duration),
      artistId: Value(artistId),
    );
  }

  factory SongTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SongTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      duration: serializer.fromJson<int>(json['duration']),
      artistId: serializer.fromJson<int>(json['artist_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'duration': serializer.toJson<int>(duration),
      'artist_id': serializer.toJson<int>(artistId),
    };
  }

  SongTable copyWith({int? id, String? name, int? duration, int? artistId}) =>
      SongTable(
        id: id ?? this.id,
        name: name ?? this.name,
        duration: duration ?? this.duration,
        artistId: artistId ?? this.artistId,
      );
  @override
  String toString() {
    return (StringBuffer('SongTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('duration: $duration, ')
          ..write('artistId: $artistId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, duration, artistId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SongTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.duration == this.duration &&
          other.artistId == this.artistId);
}

class SongCompanion extends UpdateCompanion<SongTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> duration;
  final Value<int> artistId;
  const SongCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.duration = const Value.absent(),
    this.artistId = const Value.absent(),
  });
  SongCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int duration,
    required int artistId,
  })  : name = Value(name),
        duration = Value(duration),
        artistId = Value(artistId);
  static Insertable<SongTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? duration,
    Expression<int>? artistId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (duration != null) 'duration': duration,
      if (artistId != null) 'artist_id': artistId,
    });
  }

  SongCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? duration,
      Value<int>? artistId}) {
    return SongCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      duration: duration ?? this.duration,
      artistId: artistId ?? this.artistId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (artistId.present) {
      map['artist_id'] = Variable<int>(artistId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('duration: $duration, ')
          ..write('artistId: $artistId')
          ..write(')'))
        .toString();
  }
}

class Playlist extends Table with TableInfo<Playlist, PlaylistTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Playlist(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES User(id)ON DELETE CASCADE');
  @override
  List<GeneratedColumn> get $columns => [id, name, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'Playlist';
  @override
  VerificationContext validateIntegrity(Insertable<PlaylistTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {userId},
      ];
  @override
  PlaylistTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
    );
  }

  @override
  Playlist createAlias(String alias) {
    return Playlist(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT unique_user_playlist UNIQUE(user_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class PlaylistTable extends DataClass implements Insertable<PlaylistTable> {
  final int id;
  final String name;
  final int userId;
  const PlaylistTable(
      {required this.id, required this.name, required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  PlaylistCompanion toCompanion(bool nullToAbsent) {
    return PlaylistCompanion(
      id: Value(id),
      name: Value(name),
      userId: Value(userId),
    );
  }

  factory PlaylistTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistTable(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      userId: serializer.fromJson<int>(json['user_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'user_id': serializer.toJson<int>(userId),
    };
  }

  PlaylistTable copyWith({int? id, String? name, int? userId}) => PlaylistTable(
        id: id ?? this.id,
        name: name ?? this.name,
        userId: userId ?? this.userId,
      );
  @override
  String toString() {
    return (StringBuffer('PlaylistTable(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistTable &&
          other.id == this.id &&
          other.name == this.name &&
          other.userId == this.userId);
}

class PlaylistCompanion extends UpdateCompanion<PlaylistTable> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> userId;
  const PlaylistCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.userId = const Value.absent(),
  });
  PlaylistCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int userId,
  })  : name = Value(name),
        userId = Value(userId);
  static Insertable<PlaylistTable> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (userId != null) 'user_id': userId,
    });
  }

  PlaylistCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? userId}) {
    return PlaylistCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class PlaylistWithSong extends Table
    with TableInfo<PlaylistWithSong, PlaylistWithSongTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PlaylistWithSong(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _songIdMeta = const VerificationMeta('songId');
  late final GeneratedColumn<int> songId = GeneratedColumn<int>(
      'song_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES Song(id)');
  static const VerificationMeta _playlistIdMeta =
      const VerificationMeta('playlistId');
  late final GeneratedColumn<int> playlistId = GeneratedColumn<int>(
      'playlist_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL REFERENCES Playlist(id)');
  @override
  List<GeneratedColumn> get $columns => [id, songId, playlistId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'PlaylistWithSong';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlaylistWithSongTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('song_id')) {
      context.handle(_songIdMeta,
          songId.isAcceptableOrUnknown(data['song_id']!, _songIdMeta));
    } else if (isInserting) {
      context.missing(_songIdMeta);
    }
    if (data.containsKey('playlist_id')) {
      context.handle(
          _playlistIdMeta,
          playlistId.isAcceptableOrUnknown(
              data['playlist_id']!, _playlistIdMeta));
    } else if (isInserting) {
      context.missing(_playlistIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {songId, playlistId},
      ];
  @override
  PlaylistWithSongTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaylistWithSongTable(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      songId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}song_id'])!,
      playlistId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}playlist_id'])!,
    );
  }

  @override
  PlaylistWithSong createAlias(String alias) {
    return PlaylistWithSong(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints =>
      const ['CONSTRAINT songIdWithPlaylistId UNIQUE(song_id, playlist_id)'];
  @override
  bool get dontWriteConstraints => true;
}

class PlaylistWithSongTable extends DataClass
    implements Insertable<PlaylistWithSongTable> {
  final int id;
  final int songId;
  final int playlistId;
  const PlaylistWithSongTable(
      {required this.id, required this.songId, required this.playlistId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['song_id'] = Variable<int>(songId);
    map['playlist_id'] = Variable<int>(playlistId);
    return map;
  }

  PlaylistWithSongCompanion toCompanion(bool nullToAbsent) {
    return PlaylistWithSongCompanion(
      id: Value(id),
      songId: Value(songId),
      playlistId: Value(playlistId),
    );
  }

  factory PlaylistWithSongTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaylistWithSongTable(
      id: serializer.fromJson<int>(json['id']),
      songId: serializer.fromJson<int>(json['song_id']),
      playlistId: serializer.fromJson<int>(json['playlist_id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'song_id': serializer.toJson<int>(songId),
      'playlist_id': serializer.toJson<int>(playlistId),
    };
  }

  PlaylistWithSongTable copyWith({int? id, int? songId, int? playlistId}) =>
      PlaylistWithSongTable(
        id: id ?? this.id,
        songId: songId ?? this.songId,
        playlistId: playlistId ?? this.playlistId,
      );
  @override
  String toString() {
    return (StringBuffer('PlaylistWithSongTable(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('playlistId: $playlistId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, songId, playlistId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaylistWithSongTable &&
          other.id == this.id &&
          other.songId == this.songId &&
          other.playlistId == this.playlistId);
}

class PlaylistWithSongCompanion extends UpdateCompanion<PlaylistWithSongTable> {
  final Value<int> id;
  final Value<int> songId;
  final Value<int> playlistId;
  const PlaylistWithSongCompanion({
    this.id = const Value.absent(),
    this.songId = const Value.absent(),
    this.playlistId = const Value.absent(),
  });
  PlaylistWithSongCompanion.insert({
    this.id = const Value.absent(),
    required int songId,
    required int playlistId,
  })  : songId = Value(songId),
        playlistId = Value(playlistId);
  static Insertable<PlaylistWithSongTable> custom({
    Expression<int>? id,
    Expression<int>? songId,
    Expression<int>? playlistId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (songId != null) 'song_id': songId,
      if (playlistId != null) 'playlist_id': playlistId,
    });
  }

  PlaylistWithSongCompanion copyWith(
      {Value<int>? id, Value<int>? songId, Value<int>? playlistId}) {
    return PlaylistWithSongCompanion(
      id: id ?? this.id,
      songId: songId ?? this.songId,
      playlistId: playlistId ?? this.playlistId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (songId.present) {
      map['song_id'] = Variable<int>(songId.value);
    }
    if (playlistId.present) {
      map['playlist_id'] = Variable<int>(playlistId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlaylistWithSongCompanion(')
          ..write('id: $id, ')
          ..write('songId: $songId, ')
          ..write('playlistId: $playlistId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final User user = User(this);
  late final Artist artist = Artist(this);
  late final Song song = Song(this);
  late final Playlist playlist = Playlist(this);
  late final PlaylistWithSong playlistWithSong = PlaylistWithSong(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [user, artist, song, playlist, playlistWithSong];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('Artist',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('Song', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('User',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('Playlist', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}
