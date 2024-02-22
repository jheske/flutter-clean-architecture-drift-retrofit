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
