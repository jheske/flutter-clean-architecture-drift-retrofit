import 'package:drift_local_database_example/data/model/playlist_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '.generated/user_model.freezed.dart';
part '.generated/user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    int? id,
    String? username,
    String? musicStyle,
    String? favoriteSongName,
    PlaylistModel? playlist,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  static Future<List<UserModel>> fromJsonArray(List jsonArray) async {
    return jsonArray.map((value) => UserModel.fromJson(value)).toList();
  }
}
