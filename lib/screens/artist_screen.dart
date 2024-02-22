/// Copyright (C) 2024 Jill Heske
/// This file is part of flutter-clean-architecture-drift-retrofit.
///
/// flutter-clean-architecture-drift-retrofit is free software: you can redistribute it and/or modify
/// it under the terms of the Apache License, Version 2.0, as published by
/// the Apache Software Foundation.
///
/// flutter-clean-architecture-drift-retrofit is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// Apache License, Version 2.0 for more details.
///
/// You should have received a copy of the Apache License, Version 2.0
/// along with flutter-clean-architecture-drift-retrofit. If not, see <https:///www.apache.org/licenses/LICENSE-2.0>.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/di/injection_container.dart';
import '../data/domain/entity/artist_entity.dart';
import '../data/domain/entity/song_entity.dart';
import '../data/repository/music_repository.dart';

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key});

  @override
  State createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  final repository = serviceLocator.get<Repository>();

  @override
  Widget build(BuildContext context) {
    final artist = Provider.of<ArtistEntity>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name ?? 'None'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Age: ${artist.age}', style: theme.textTheme.titleMedium),
            const SizedBox(height: 10),
            Text(
              'Music Style: ${artist.musicStyle}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text('Songs:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 10),
            FutureBuilder<List<SongEntity>>(
              future: repository.getSongsByArtistId(artist.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final List<SongEntity> songs = snapshot.data ?? [];
                    return SizedBox(
                        height: 200, // Limit height to allow scrolling
                        child: ListView.builder(
                          itemCount: songs.length,
                          itemBuilder: (context, index) {
                            final song = songs[index];
                            return ListTile(
                              title: Text(song.name ?? ''),
                              subtitle: Text('Duration: ${song.duration}'),
                            );
                          },
                        ));
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
/*
child: ListView(
                        children: songs.map((song) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              '${song.name} - Duration: ${song.duration}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
 */
