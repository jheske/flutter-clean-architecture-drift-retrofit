// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../playlist_with_song_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaylistWithSongModel _$PlaylistWithSongModelFromJson(
    Map<String, dynamic> json) {
  return _PlaylistWithSongModel.fromJson(json);
}

/// @nodoc
mixin _$PlaylistWithSongModel {
  int? get songId => throw _privateConstructorUsedError;
  int? get playlistId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistWithSongModelCopyWith<PlaylistWithSongModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistWithSongModelCopyWith<$Res> {
  factory $PlaylistWithSongModelCopyWith(PlaylistWithSongModel value,
          $Res Function(PlaylistWithSongModel) then) =
      _$PlaylistWithSongModelCopyWithImpl<$Res, PlaylistWithSongModel>;
  @useResult
  $Res call({int? songId, int? playlistId});
}

/// @nodoc
class _$PlaylistWithSongModelCopyWithImpl<$Res,
        $Val extends PlaylistWithSongModel>
    implements $PlaylistWithSongModelCopyWith<$Res> {
  _$PlaylistWithSongModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = freezed,
    Object? playlistId = freezed,
  }) {
    return _then(_value.copyWith(
      songId: freezed == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int?,
      playlistId: freezed == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistWithSongModelImplCopyWith<$Res>
    implements $PlaylistWithSongModelCopyWith<$Res> {
  factory _$$PlaylistWithSongModelImplCopyWith(
          _$PlaylistWithSongModelImpl value,
          $Res Function(_$PlaylistWithSongModelImpl) then) =
      __$$PlaylistWithSongModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? songId, int? playlistId});
}

/// @nodoc
class __$$PlaylistWithSongModelImplCopyWithImpl<$Res>
    extends _$PlaylistWithSongModelCopyWithImpl<$Res,
        _$PlaylistWithSongModelImpl>
    implements _$$PlaylistWithSongModelImplCopyWith<$Res> {
  __$$PlaylistWithSongModelImplCopyWithImpl(_$PlaylistWithSongModelImpl _value,
      $Res Function(_$PlaylistWithSongModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = freezed,
    Object? playlistId = freezed,
  }) {
    return _then(_$PlaylistWithSongModelImpl(
      songId: freezed == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as int?,
      playlistId: freezed == playlistId
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaylistWithSongModelImpl extends _PlaylistWithSongModel {
  const _$PlaylistWithSongModelImpl({this.songId, this.playlistId}) : super._();

  factory _$PlaylistWithSongModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistWithSongModelImplFromJson(json);

  @override
  final int? songId;
  @override
  final int? playlistId;

  @override
  String toString() {
    return 'PlaylistWithSongModel(songId: $songId, playlistId: $playlistId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistWithSongModelImpl &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.playlistId, playlistId) ||
                other.playlistId == playlistId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, songId, playlistId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistWithSongModelImplCopyWith<_$PlaylistWithSongModelImpl>
      get copyWith => __$$PlaylistWithSongModelImplCopyWithImpl<
          _$PlaylistWithSongModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistWithSongModelImplToJson(
      this,
    );
  }
}

abstract class _PlaylistWithSongModel extends PlaylistWithSongModel {
  const factory _PlaylistWithSongModel(
      {final int? songId, final int? playlistId}) = _$PlaylistWithSongModelImpl;
  const _PlaylistWithSongModel._() : super._();

  factory _PlaylistWithSongModel.fromJson(Map<String, dynamic> json) =
      _$PlaylistWithSongModelImpl.fromJson;

  @override
  int? get songId;
  @override
  int? get playlistId;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistWithSongModelImplCopyWith<_$PlaylistWithSongModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
