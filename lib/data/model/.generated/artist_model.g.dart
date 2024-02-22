// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistModelImpl _$$ArtistModelImplFromJson(Map<String, dynamic> json) =>
    _$ArtistModelImpl(
      id: json['id'] as int,
      name: json['name'] as String?,
      musicStyle: json['musicStyle'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$$ArtistModelImplToJson(_$ArtistModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'musicStyle': instance.musicStyle,
      'age': instance.age,
    };
