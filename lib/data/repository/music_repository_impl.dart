import 'dart:io';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:drift_local_database_example/data/domain/entity/artist_entity.dart';
import 'package:drift_local_database_example/data/domain/entity/playlist_entity.dart';
import 'package:drift_local_database_example/data/domain/entity/song_entity.dart';
import 'package:drift_local_database_example/data/model/model_extensions.dart';
import 'package:drift_local_database_example/data/model/music_model.dart';
import 'package:drift_local_database_example/data/repository/music_repository.dart';
import 'package:flutter/foundation.dart';

import '../../utils/music_local_data_source.dart';
import '../domain/entity/user_entity.dart';
import '../local/database/app_database.dart';
import '../model/artist_model.dart';
import '../model/song_model.dart';
import '../model/user_model.dart';
import '../remote/music_api_service.dart';

/// This class is the implementation of the [ArticleRepository] interface.
/// It implements the database CRUD operations.
/// Example usage:
/// ```dart
/// serviceLocator.get<DatabaseRepository>();
///```
class MusicRepositoryImpl implements Repository {
  final AppDatabase _db;
  final MusicApiService _apiService;

  MusicRepositoryImpl(this._db, this._apiService);

  @override
  Future<MusicModel> fetchMusic() async {
    try {
      final httpResponse = await _apiService.fetchMusic();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return httpResponse.data;
      } else {
        return MusicModel.init();
      }
    } on DioException catch (e) {
      return MusicModel.init();
    }
  }

  @override
  Future<void> clearDatabase() async {
    await _db.delete(_db.user).go();
    await _db.delete(_db.artist).go();
    await _db.delete(_db.song).go();
    await _db.delete(_db.playlistWithSong).go();
    await _db.delete(_db.playlist).go();
  }

  /// Get the music data from the local data source, which
  /// you can find in music_local_data_source.dart.
  @override
  Future<void> getMusicFromLocalSource() async {
    List<UserModel> users = [];
    List<SongModel> songs = [];
    List<ArtistModel> artists = [];

    MusicModel musicModel = MusicModel.fromJson(MusicDataSource.musicDataSource);

    for (var user in musicModel.users) {
      users.add(user);
    }
    for (var song in musicModel.songs) {
      songs.add(song);
    }
    for (var artist in musicModel.artists) {
      artists.add(artist);
    }

    await saveDataToLocalDatabase(users, artists, songs);
    if (kDebugMode) {
      await retrieveDataFromLocalDatabase();
    }
  }

  Future<void> saveDataToLocalDatabase(
    List<UserModel> userModelList,
    List<ArtistModel> artistModelList,
    List<SongModel> songModelList,
  ) async {
    await artistModelList.saveToDatabase();
    await songModelList.saveToDatabase();
    await userModelList.saveToDatabase();
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    List<UserEntity> entityList = [];
    List<UserTable> userTableList = await _db.select(_db.user).get();

    await Future.forEach(userTableList, (userTable) async {
      final playlist = await _getPlaylistByUserId(userTable.id);
      UserEntity? userEntity = await UserEntity.convertTableToEntity(userTable, playlist);
      if (userEntity != null) {
        entityList.add(userEntity);
      }
    });
    return entityList;
  }

  ////Build a complete UserEntity from all the tables.
  ///First get the user from the User table.
  ///Then use userId to get the playlist.
  ///The playlist will include the songs and their artists.
  @override
  Future<UserEntity?> getUserById(int userId) async {
    UserTable? userTable =
        await (_db.select(_db.user)..where((tbl) => tbl.id.equals(userId))).getSingleOrNull();
    if (userTable != null) {
      final playlist = await _getPlaylistByUserId(userId);
      return await UserEntity.convertTableToEntity(userTable, playlist);
    } else {
      return null;
    }
  }

  @override
  Future<List<ArtistEntity>> getArtists() async {
    List<ArtistEntity> entityList = [];
    List<ArtistTable> artistTableList = await _db.select(_db.artist).get();

    await Future.forEach(artistTableList, (artistTable) async {
      final entity = ArtistEntity(
        id: artistTable.id,
        name: artistTable.name,
        musicStyle: artistTable.musicStyle,
        age: artistTable.age,
      );
      entityList.add(entity);
    });
    return entityList;
  }

  @override
  Future<ArtistEntity> getArtistById(int artistId) async {
    ArtistTable? artistTable =
        await (_db.select(_db.artist)..where((tbl) => tbl.id.equals(artistId))).getSingleOrNull();

    if (artistTable != null) {
      return ArtistEntity(
        id: artistTable.id,
        name: artistTable.name,
        musicStyle: artistTable.musicStyle,
        age: artistTable.age,
      );
    } else {
      return ArtistEntity();
    }
  }

  @override
  Future<List<SongEntity>> getSongs() async {
    final songEntityList = <SongEntity>[];

    // Perform a join operation between Song and Artist tables
    final result = await _db.select(_db.song).join([
      innerJoin(_db.artist, _db.artist.id.equalsExp(_db.song.artistId)),
    ]).get();

    for (final row in result) {
      final songTable = row.readTable(_db.song);
      final artistTable = row.readTable(_db.artist);

      final songEntity = SongEntity(
        id: songTable.id,
        name: songTable.name,
        duration: songTable.duration,
        artist: ArtistEntity(
          id: artistTable.id,
          name: artistTable.name,
          musicStyle: artistTable.musicStyle,
          age: artistTable.age,
        ),
      );
      songEntityList.add(songEntity);
    }

    return songEntityList;
  }

  @override
  Future<SongEntity?> getSongById(int id) async {
    SongTable? table =
        await (_db.select(_db.song)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    return await SongEntity.convertTableToEntity(table);
  }

  @override
  Future<List<SongEntity>> getSongsByArtistId(int artistId) async {
    final List<SongEntity> songList = [];
    final List<SongTable> songTableList = await (_db.select(_db.song)
          ..where(
            (tbl) => tbl.artistId.equals(artistId),
          ))
        .get();

    // Convert SongTable to SongEntity for each song
    await Future.forEach(songTableList, (songTable) async {
      final SongEntity? songEntity = await SongEntity.convertTableToEntity(songTable);
      if (songEntity != null) {
        songList.add(songEntity);
      }
    });

    return songList;
  }

  @override
  Future<void> retrieveDataFromLocalDatabase() async {
    final artists = await getArtists();
    final songs = await getSongs();
    final users = await getUsers();

    if (kDebugMode) {
      print('Artists[0]: ${artists[0].name}');
      print('Songs[0]: ${songs[0].name}');
      print('Users[0]: ${users[0].username}');
    }
  }

  /// Get the songs in the user's playlist from the Playlist, Song, and Artist tables.
  /// Get playlist details from the Playlist table.
  /// Return the entire PlaylistEntity.
  /// The app currently supports only one playlist per user.
  /// As such there is a contraint on the playlist table:
  ///    CONSTRAINT unique_user_playlist UNIQUE (user_id)
  /// It could be extended to support multiple playlists per user.
  /// in which case we would query by userId and playlistId and
  /// the return type would be a List<PlaylistEntity>.
  Future<PlaylistEntity?> _getPlaylistByUserId(int userId) async {
    PlaylistTable? table = await (_db.select(_db.playlist)
          ..where((tbl) => tbl.userId.equals(userId)))
        .getSingleOrNull();

    final playlistId = table?.id;
    List<SongEntity> songs = [];

    if (playlistId != null) {
      songs = await _getPlaylistSongsById(playlistId);
    }
    if (table != null) {
      return PlaylistEntity(
        id: table.id,
        name: table.name,
        userId: table.userId,
        songs: songs,
      );
    }
    return const PlaylistEntity();
  }

  /// This separate query gets all the songs in the playlist with their artist information.
  Future<List<SongEntity>> _getPlaylistSongsById(int playlistId) async {
    final query = _db.select(_db.song).join([
      innerJoin(_db.playlistWithSong, _db.playlistWithSong.songId.equalsExp(_db.song.id)),
      innerJoin(_db.artist, _db.artist.id.equalsExp(_db.song.artistId)), // Join with Artist table
    ])
      ..where(
          _db.playlistWithSong.playlistId.equals(playlistId)); // Condition for specific playlistId

    final List<SongEntity> songsInPlaylist = await query.map((row) {
      final song = row.readTable(_db.song);
      final artist = row.readTable(_db.artist); // Read Artist information
      return SongEntity(
        id: song.id,
        name: song.name,
        duration: song.duration,
        artist: ArtistEntity(
          id: artist.id,
          name: artist.name,
          age: artist.age,
          musicStyle: artist.musicStyle,
        ),
      );
    }).get();

    return songsInPlaylist;
  }
}
/*
/// Try this later with Bloc and UseCases
 @override
  Future<DataState<MusicModel?>> fetchMusic() async {
    try {
      final httpResponse = await _apiService.fetchMusic();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
 */
