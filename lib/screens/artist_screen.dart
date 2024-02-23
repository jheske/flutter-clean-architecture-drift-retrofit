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

// This class represents the ArtistScreen, which is a StatefulWidget used to display
// information about a specific artist. It contains a Scaffold with an AppBar and
// body content to show details about the artist, including their age, music style,
// and a list of songs associated with them.

class ArtistScreen extends StatefulWidget {
  const ArtistScreen({super.key}); // Constructor for ArtistScreen.

  @override
  State createState() => _ArtistScreenState(); // Create state for ArtistScreen.
}

// State class for ArtistScreen.
class _ArtistScreenState extends State<ArtistScreen> {
  // Repository instance obtained from the service locator.
  final repository = serviceLocator.get<Repository>();

  // Build method to construct the UI for ArtistScreen.
  @override
  Widget build(BuildContext context) {
    final artist = Provider.of<ArtistEntity>(context); // Obtain artist data from Provider.
    final theme = Theme.of(context); // Obtain theme data from context.

    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: AppBar(
        title: Text(artist.name ?? 'None'), // Display artist's name in the app bar.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display artist's age.
            Text('Age: ${artist.age}', style: theme.textTheme.titleMedium),
            const SizedBox(height: 10), // Spacer.
            // Display artist's music style.
            Text(
              'Music Style: ${artist.musicStyle}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20), // Spacer.
            // Display section header for songs.
            Text('Songs:', style: theme.textTheme.titleMedium),
            const SizedBox(height: 10), // Spacer.
            // FutureBuilder to asynchronously fetch and display songs associated with the artist.
            FutureBuilder<List<SongEntity>>(
              future: repository.getSongsByArtistId(artist.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Show loading indicator while waiting for data.
                } else {
                  if (snapshot.hasError) {
                    return Text(
                        'Error: ${snapshot.error}'); // Show error message if data fetching fails.
                  } else {
                    final List<SongEntity> songs = snapshot.data ?? []; // Get list of songs.
                    return SizedBox(
                        height: 200, // Limit height to allow scrolling
                        child: ListView.builder(
                          itemCount: songs.length,
                          itemBuilder: (context, index) {
                            final song = songs[index]; // Get current song.
                            return ListTile(
                              title: Text(song.name ?? ''), // Display song name.
                              subtitle:
                                  Text('Duration: ${song.duration}'), // Display song duration.
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
