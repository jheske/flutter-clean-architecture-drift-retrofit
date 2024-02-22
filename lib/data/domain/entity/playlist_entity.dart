import 'package:drift_local_database_example/data/domain/entity/song_entity.dart';
import 'package:equatable/equatable.dart';

class PlaylistEntity extends Equatable {
  final int id;
  final String name;
  final int userId;
  final List<SongEntity> songs;

  const PlaylistEntity({
    this.id = 0,
    this.name = '',
    this.userId = -1,
    this.songs = const [],
  });

  PlaylistEntity copyWith({
    int? id,
    String? name,
    int? userId,
    List<SongEntity>? songs,
  }) {
    return PlaylistEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      userId: userId ?? this.userId,
      songs: songs ?? this.songs,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      userId,
      songs,
    ];
  }
}
