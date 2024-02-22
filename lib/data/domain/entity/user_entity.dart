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
import 'package:drift_local_database_example/data/domain/entity/playlist_entity.dart';

import '../../local/database/app_database.dart';

class UserEntity {
  int id;
  String username;
  String? favoriteSongName;
  String? musicStyle;
  PlaylistEntity? playlist;

  UserEntity({
    this.id = -1,
    this.username = '',
    this.favoriteSongName,
    this.musicStyle,
    this.playlist,
  });

  void setUser(UserEntity user) {
    id = user.id;
    username = user.username;
    favoriteSongName = user.favoriteSongName;
    musicStyle = user.musicStyle;
    playlist = user.playlist;
  }

  UserEntity copyWith({
    int? id,
    String? username,
    String? favoriteSongName,
    String? musicStyle,
    PlaylistEntity? playlist,
  }) {
    return UserEntity(
      id: id ?? this.id,
      username: username ?? this.username,
      favoriteSongName: favoriteSongName ?? this.favoriteSongName,
      musicStyle: musicStyle ?? this.musicStyle,
      playlist: playlist ?? this.playlist,
    );
  }

  static Future<UserEntity?> convertTableToEntity(
    UserTable? userTable,
    PlaylistEntity? playlist,
  ) async {
    if (userTable != null) {
      return UserEntity(
        id: userTable.id,
        username: userTable.username,
        musicStyle: userTable.musicStyle,
        favoriteSongName: userTable.favoriteSongName,
        playlist: playlist,
      );
    } else {
      return null;
    }
  }
}
