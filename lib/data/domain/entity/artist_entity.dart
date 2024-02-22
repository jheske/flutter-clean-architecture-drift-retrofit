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
