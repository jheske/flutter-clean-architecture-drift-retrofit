// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as int?,
      username: json['username'] as String?,
      musicStyle: json['musicStyle'] as String?,
      favoriteSongName: json['favoriteSongName'] as String?,
      playlist: json['playlist'] == null
          ? null
          : PlaylistModel.fromJson(json['playlist'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'musicStyle': instance.musicStyle,
      'favoriteSongName': instance.favoriteSongName,
      'playlist': instance.playlist,
    };
