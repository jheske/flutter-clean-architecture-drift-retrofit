import 'package:freezed_annotation/freezed_annotation.dart';

part '.generated/song_model.freezed.dart';
part '.generated/song_model.g.dart';

@freezed
class SongModel with _$SongModel {
  const factory SongModel({
    required int id,
    String? name,
    int? duration,
    int? artistId,
  }) = _SongModel;

  const SongModel._();

  factory SongModel.fromJson(Map<String, dynamic> json) => _$SongModelFromJson(json);

  static Future<List<SongModel>> fromJsonArray(List jsonArray) async {
    return jsonArray.map((value) {
      return SongModel.fromJson(value);
    }).toList();
  }
}
