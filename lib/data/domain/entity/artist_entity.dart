import 'package:drift_local_database_example/data/domain/entity/song_entity.dart';

import '../../model/artist_model.dart';

class ArtistEntity {
  int id;
  String? name = '';
  String? musicStyle = '';
  int? age = 0;
  List<SongEntity> songs = [];

  ArtistEntity({
    this.id = -1,
    this.name,
    this.musicStyle,
    this.age,
    this.songs = const [],
  });

  void setArtist(ArtistEntity artist) {
    id = artist.id;
    name = artist.name;
    musicStyle = artist.musicStyle;
    age = artist.age;
    songs = artist.songs;
  }

  factory ArtistEntity.fromModel(ArtistModel model) {
    return ArtistEntity(
      id: model.id,
      name: model.name,
      musicStyle: model.musicStyle,
      age: model.age,
    );
  }

  Future<ArtistModel> toModel() async {
    return ArtistModel(
      id: id,
      name: name,
      musicStyle: musicStyle,
      age: age,
    );
  }
}
