// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../playlist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaylistModelImpl _$$PlaylistModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistModelImpl(
      id: json['id'] as int,
      userId: json['user_id'] as int,
      name: json['name'] as String?,
      songs: (json['songs'] as List<dynamic>?)?.map((e) => e as int?).toList(),
    );

Map<String, dynamic> _$$PlaylistModelImplToJson(_$PlaylistModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'songs': instance.songs,
    };
