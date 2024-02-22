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

class PlaylistEntity {
  final int id;
  final String name;
  final int userId;
  final List<SongEntity> songs;

  const PlaylistEntity({
    this.id = 0,
    this.name = '',
    this.userId = -1,
    this.songs = const [],
  });

  PlaylistEntity copyWith({
    int? id,
    String? name,
    int? userId,
    List<SongEntity>? songs,
  }) {
    return PlaylistEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      songs: songs ?? this.songs,
    );
  }
}
