// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part '.generated/playlist_model.freezed.dart';
part '.generated/playlist_model.g.dart';

@freezed
class PlaylistModel with _$PlaylistModel {
  const factory PlaylistModel({
    required int id,
    @JsonKey(name: "user_id") required int userId,
    String? name,
    @JsonKey(name: "songs") List<int?>? songs,
  }) = _PlaylistModel;

  const PlaylistModel._();

  factory PlaylistModel.fromJson(Map<String, dynamic> json) => _$PlaylistModelFromJson(json);
}
