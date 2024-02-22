// ignore_for_file: invalid_annotation_target
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
import 'package:drift_local_database_example/data/model/song_model.dart';
import 'package:drift_local_database_example/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'artist_model.dart';

part '.generated/music_model.freezed.dart';
part '.generated/music_model.g.dart';

@freezed
class MusicModel with _$MusicModel {
  const factory MusicModel({
    @JsonKey(name: 'Users') required List<UserModel> users,
    @JsonKey(name: 'Songs') required List<SongModel> songs,
    @JsonKey(name: 'Artists') required List<ArtistModel> artists,
  }) = _MusicModel;

  factory MusicModel.init() => const MusicModel(
        users: [],
        songs: [],
        artists: [],
      );

  factory MusicModel.fromJson(Map<String, dynamic> json) => _$MusicModelFromJson(json);

  const MusicModel._();
}
