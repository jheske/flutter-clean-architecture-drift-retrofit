import 'package:freezed_annotation/freezed_annotation.dart';

part '.generated/artist_model.freezed.dart';
part '.generated/artist_model.g.dart';

@freezed
class ArtistModel with _$ArtistModel {
  const factory ArtistModel({
    required int id,
    String? name,
    String? musicStyle,
    int? age,
  }) = _ArtistModel;

  const ArtistModel._();

  factory ArtistModel.fromJson(Map<String, dynamic> json) => _$ArtistModelFromJson(json);

  static Future<List<ArtistModel>> fromJsonArray(List jsonArray) async {
    return jsonArray.map((value) {
      return ArtistModel.fromJson(value);
    }).toList();
  }
}
