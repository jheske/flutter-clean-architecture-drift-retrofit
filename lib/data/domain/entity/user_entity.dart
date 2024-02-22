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
