import 'package:drift_local_database_example/data/domain/entity/artist_entity.dart';
import 'package:drift_local_database_example/data/domain/entity/song_entity.dart';
import 'package:equatable/equatable.dart';

class SongWithArtistEntity extends Equatable {
  final SongEntity? song;
  final ArtistEntity? artist;

  const SongWithArtistEntity({
    this.song,
    this.artist,
  });

  @override
  get props => [song, artist];
}
