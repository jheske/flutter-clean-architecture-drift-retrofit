// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../music_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MusicModel _$MusicModelFromJson(Map<String, dynamic> json) {
  return _MusicModel.fromJson(json);
}

/// @nodoc
mixin _$MusicModel {
  @JsonKey(name: 'Users')
  List<UserModel> get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'Songs')
  List<SongModel> get songs => throw _privateConstructorUsedError;
  @JsonKey(name: 'Artists')
  List<ArtistModel> get artists => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicModelCopyWith<MusicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicModelCopyWith<$Res> {
  factory $MusicModelCopyWith(
          MusicModel value, $Res Function(MusicModel) then) =
      _$MusicModelCopyWithImpl<$Res, MusicModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Users') List<UserModel> users,
      @JsonKey(name: 'Songs') List<SongModel> songs,
      @JsonKey(name: 'Artists') List<ArtistModel> artists});
}

/// @nodoc
class _$MusicModelCopyWithImpl<$Res, $Val extends MusicModel>
    implements $MusicModelCopyWith<$Res> {
  _$MusicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? songs = null,
    Object? artists = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      songs: null == songs
          ? _value.songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
      artists: null == artists
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MusicModelImplCopyWith<$Res>
    implements $MusicModelCopyWith<$Res> {
  factory _$$MusicModelImplCopyWith(
          _$MusicModelImpl value, $Res Function(_$MusicModelImpl) then) =
      __$$MusicModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Users') List<UserModel> users,
      @JsonKey(name: 'Songs') List<SongModel> songs,
      @JsonKey(name: 'Artists') List<ArtistModel> artists});
}

/// @nodoc
class __$$MusicModelImplCopyWithImpl<$Res>
    extends _$MusicModelCopyWithImpl<$Res, _$MusicModelImpl>
    implements _$$MusicModelImplCopyWith<$Res> {
  __$$MusicModelImplCopyWithImpl(
      _$MusicModelImpl _value, $Res Function(_$MusicModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? songs = null,
    Object? artists = null,
  }) {
    return _then(_$MusicModelImpl(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      songs: null == songs
          ? _value._songs
          : songs // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
      artists: null == artists
          ? _value._artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<ArtistModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MusicModelImpl extends _MusicModel {
  const _$MusicModelImpl(
      {@JsonKey(name: 'Users') required final List<UserModel> users,
      @JsonKey(name: 'Songs') required final List<SongModel> songs,
      @JsonKey(name: 'Artists') required final List<ArtistModel> artists})
      : _users = users,
        _songs = songs,
        _artists = artists,
        super._();

  factory _$MusicModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MusicModelImplFromJson(json);

  final List<UserModel> _users;
  @override
  @JsonKey(name: 'Users')
  List<UserModel> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<SongModel> _songs;
  @override
  @JsonKey(name: 'Songs')
  List<SongModel> get songs {
    if (_songs is EqualUnmodifiableListView) return _songs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songs);
  }

  final List<ArtistModel> _artists;
  @override
  @JsonKey(name: 'Artists')
  List<ArtistModel> get artists {
    if (_artists is EqualUnmodifiableListView) return _artists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artists);
  }

  @override
  String toString() {
    return 'MusicModel(users: $users, songs: $songs, artists: $artists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MusicModelImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._songs, _songs) &&
            const DeepCollectionEquality().equals(other._artists, _artists));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_songs),
      const DeepCollectionEquality().hash(_artists));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MusicModelImplCopyWith<_$MusicModelImpl> get copyWith =>
      __$$MusicModelImplCopyWithImpl<_$MusicModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MusicModelImplToJson(
      this,
    );
  }
}

abstract class _MusicModel extends MusicModel {
  const factory _MusicModel(
          {@JsonKey(name: 'Users') required final List<UserModel> users,
          @JsonKey(name: 'Songs') required final List<SongModel> songs,
          @JsonKey(name: 'Artists') required final List<ArtistModel> artists}) =
      _$MusicModelImpl;
  const _MusicModel._() : super._();

  factory _MusicModel.fromJson(Map<String, dynamic> json) =
      _$MusicModelImpl.fromJson;

  @override
  @JsonKey(name: 'Users')
  List<UserModel> get users;
  @override
  @JsonKey(name: 'Songs')
  List<SongModel> get songs;
  @override
  @JsonKey(name: 'Artists')
  List<ArtistModel> get artists;
  @override
  @JsonKey(ignore: true)
  _$$MusicModelImplCopyWith<_$MusicModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
