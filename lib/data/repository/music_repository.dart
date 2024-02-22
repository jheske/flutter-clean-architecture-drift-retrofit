/// Copyright (C) 2024 Jill Heske
/// This file is part of flutter-clean-architecture-drift-retrofit.
///
/// flutter-clean-architecture-drift-retrofit is free software: you can redistribute it and/or modify
/// it under the terms of the Apache License, Version 2.0, as published by
/// the Apache Software Foundation.
///
/// flutter-clean-architecture-drift-retrofit is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// Apache License, Version 2.0 for more details.
///
/// You should have received a copy of the Apache License, Version 2.0
/// along with flutter-clean-architecture-drift-retrofit. If not, see <https:///www.apache.org/licenses/LICENSE-2.0>.
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
