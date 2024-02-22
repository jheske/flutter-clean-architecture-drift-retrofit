import 'package:drift_local_database_example/data/domain/entity/artist_entity.dart';

import '../domain/entity/song_entity.dart';
import '../domain/entity/user_entity.dart';
import '../model/music_model.dart';

///The base interface for the database repository.
///The database repository is responsible for handling all the database operations.
///Methods are implemented in [DatabaseRepositoryImpl].
abstract class Repository {
  Future<MusicModel> fetchMusic();
  Future<void> clearDatabase();
  Future<void> getMusicFromLocalSource();
  Future<List<UserEntity>> getUsers();
  Future<UserEntity?> getUserById(int id);
  Future<List<ArtistEntity>> getArtists();
  Future<ArtistEntity?> getArtistById(int id);
  Future<List<SongEntity>> getSongs();
  Future<SongEntity?> getSongById(int id);
  Future<List<SongEntity>> getSongsByArtistId(int artistId);
  Future<void> retrieveDataFromLocalDatabase();
}
