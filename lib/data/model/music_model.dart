// ignore_for_file: invalid_annotation_target
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
