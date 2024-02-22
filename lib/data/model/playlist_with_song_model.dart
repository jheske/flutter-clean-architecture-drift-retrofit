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
import 'package:freezed_annotation/freezed_annotation.dart';

part '.generated/playlist_with_song_model.freezed.dart';
part '.generated/playlist_with_song_model.g.dart';

@freezed
class PlaylistWithSongModel with _$PlaylistWithSongModel {
  const factory PlaylistWithSongModel({
    int? songId,
    int? playlistId,
  }) = _PlaylistWithSongModel;

  const PlaylistWithSongModel._();

  factory PlaylistWithSongModel.fromJson(Map<String, dynamic> json) =>
      _$PlaylistWithSongModelFromJson(json);

  static Future<List<PlaylistWithSongModel>> fromJsonArray(List jsonArray) async {
    return jsonArray.map((value) {
      return PlaylistWithSongModel.fromJson(value);
    }).toList();
  }
}
