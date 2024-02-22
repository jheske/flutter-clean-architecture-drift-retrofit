// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MusicModelImpl _$$MusicModelImplFromJson(Map<String, dynamic> json) =>
    _$MusicModelImpl(
      users: (json['Users'] as List<dynamic>)
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      songs: (json['Songs'] as List<dynamic>)
          .map((e) => SongModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      artists: (json['Artists'] as List<dynamic>)
          .map((e) => ArtistModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MusicModelImplToJson(_$MusicModelImpl instance) =>
    <String, dynamic>{
      'Users': instance.users,
      'Songs': instance.songs,
      'Artists': instance.artists,
    };
