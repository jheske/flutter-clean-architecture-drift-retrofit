import 'package:drift_local_database_example/data/domain/entity/artist_entity.dart';

import '../../local/database/app_database.dart';
import '../../model/song_model.dart';

class SongEntity {
  int id;
  String? name;
  int? duration;
  ArtistEntity? artist = ArtistEntity();

  SongEntity({
    this.id = -1,
    this.name = '',
    this.duration = 0,
    this.artist,
  });

  void setSong(SongEntity song) {
    id = song.id;
    name = song.name;
    duration = song.duration;
    artist = song.artist;
  }

  static Future<SongEntity?> convertTableToEntity(SongTable? songTable) async {
    if (songTable != null) {
      return SongEntity(
        id: songTable.id,
        name: songTable.name,
        duration: songTable.duration,
      );
    } else {
      return null;
    }
  }

  SongModel toModel() {
    return SongModel(
      id: id,
      name: name,
      duration: duration,
      artistId: artist?.id,
    );
  }
}
