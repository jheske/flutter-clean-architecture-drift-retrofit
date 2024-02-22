import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/model/playlist_model.dart';
import 'package:drift_local_database_example/data/model/playlist_with_song_model.dart';
import 'package:drift_local_database_example/data/model/song_model.dart';
import 'package:drift_local_database_example/data/model/user_model.dart';
import 'package:flutter/foundation.dart';

import '../../../core/di/injection_container.dart';
import '../local/database/app_database.dart';
import 'artist_model.dart';
import 'music_model.dart';

/// drift.dart conflicts with the freezed package.
/// Moving database function to the extension in a separate
/// file avoids the conflict.

extension MusicModelExtension on MusicModel {
  Future<void> saveToDatabase() async {
    List<UserModel> userModels = [];
    List<SongModel> songModels = [];
    List<ArtistModel> artistModels = [];

    for (var user in users) {
      userModels.add(user);
    }
    for (var song in songs) {
      songModels.add(song);
    }
    for (var artist in artists) {
      artistModels.add(artist);
    }
    if (kDebugMode) {
      print('First remote user: ${users[0].username}');
      print('First remote song: ${songs[0].name}');
      print('First remote artist: ${artists[0].name}');
    }
    await artistModels.saveToDatabase();
    await songModels.saveToDatabase();
    await userModels.saveToDatabase();
  }
}

extension UserModelExtension on UserModel {
  Future<UserCompanion> toCompanion() async {
    return UserCompanion(
      id: Value(id ?? -1),
      username: Value(username ?? ''),
      musicStyle: Value(musicStyle ?? ''),
      favoriteSongName: Value(favoriteSongName ?? ''),
    );
  }

  Future<void> saveToDatabase() async {
    AppDatabase db = serviceLocator.get<AppDatabase>();
    await db.into(db.user).insertOnConflictUpdate(await toCompanion());
    if (playlist != null) {
      await playlist!.saveToDatabase();
    }
  }
}

extension UserModelListExtension on List<UserModel> {
  Future<void> saveToDatabase() async {
    await Future.forEach(this, (user) async {
      await user.saveToDatabase();
    });
  }
}

extension ArtistModelExtension on ArtistModel {
  Future<ArtistCompanion> toCompanion() async {
    return ArtistCompanion(
        id: Value(id ?? -1),
        name: Value(name ?? ''),
        musicStyle: Value(musicStyle ?? ''),
        age: Value(age ?? 0));
  }

  Future<void> saveToDatabase() async {
    AppDatabase db = serviceLocator.get<AppDatabase>();
    final companion = await toCompanion();
    await db.into(db.artist).insertOnConflictUpdate(companion);
  }
}

extension ArtistModelListExtension on List<ArtistModel> {
  Future<void> saveToDatabase() async {
    await Future.forEach(this, (model) async {
      await model.saveToDatabase();
    });
  }
}

extension SongModelExtension on SongModel {
  Future<SongCompanion> toCompanion() async {
    return SongCompanion(
        id: Value(id ?? -1),
        name: Value(name ?? ''),
        duration: Value(duration ?? 0),
        artistId: Value(artistId ?? -1));
  }

  Future<void> saveToDatabase() async {
    AppDatabase db = serviceLocator.get<AppDatabase>();
    final companion = await toCompanion();
    await db.into(db.song).insertOnConflictUpdate(companion);
  }
}

extension SongModelListExtension on List<SongModel> {
  Future<void> saveToDatabase() async {
    await Future.forEach(this, (model) async {
      await model.saveToDatabase();
    });
  }
}

extension PlaylistModelExtension on PlaylistModel {
  Future<PlaylistCompanion> toCompanion() async {
    return PlaylistCompanion(
      id: Value(id ?? -1),
      name: Value(name ?? ''),
      userId: Value(userId ?? 0),
    );
  }

  Future<void> _saveSongAndRelationshipData(List<int?> songIdList, int playlistId) async {
    await Future.forEach(songIdList, (songId) async {
      // PlaylistModel has details about the playlist (name, etc) plus its SongModel list.
      // A SongModel has all the song details.
      // PlaylistWithSongModel has a songId and a playlistId, used in join queries to
      // get all songs for a playlist.
      final model = PlaylistWithSongModel(songId: songId, playlistId: playlistId);
      await model.saveToDatabase();
    });
  }

  Future<void> saveToDatabase() async {
    AppDatabase db = serviceLocator.get<AppDatabase>();
    await db.into(db.playlist).insertOnConflictUpdate(await toCompanion());

    if (songs != null) {
      await _saveSongAndRelationshipData(songs ?? [], id ?? -1);
    }
  }
}

extension PlaylistWithSongModelExtension on PlaylistWithSongModel {
  Future<PlaylistWithSongCompanion> toCompanion() async {
    return PlaylistWithSongCompanion(
      songId: Value(songId ?? -1),
      playlistId: Value(playlistId ?? -1),
    );
  }

  Future<void> saveToDatabase() async {
    AppDatabase db = serviceLocator.get<AppDatabase>();
    await db.into(db.playlistWithSong).insertOnConflictUpdate(await toCompanion());
  }
}