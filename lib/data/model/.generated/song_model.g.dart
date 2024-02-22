// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongModelImpl _$$SongModelImplFromJson(Map<String, dynamic> json) =>
    _$SongModelImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      duration: json['duration'] as int?,
      artistId: json['artistId'] as int?,
    );

Map<String, dynamic> _$$SongModelImplToJson(_$SongModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'artistId': instance.artistId,
    };
