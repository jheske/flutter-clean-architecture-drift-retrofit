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

import '../core/di/injection_container.dart';
import '../data/domain/entity/song_entity.dart';
import '../data/repository/music_repository.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

// State class for SongsScreen, which displays a list of Songs and their details,
// including artist name and duration.
class _SongsScreenState extends State<SongsScreen> {
  // Repository instance obtained from the service locator.
  final _repository = serviceLocator<Repository>();

  // Build method to construct the UI for SongsScreen.
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Songs'), // Set app bar title.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon.
          onPressed: () {
            GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
          },
        ),
      ),
      body: FutureBuilder(
        future: _repository.getSongs(), // Fetch list of songs asynchronously.
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Show loading indicator while waiting for data.
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Show error message if data fetching fails.
            } else {
              final songs = snapshot.data as List<SongEntity>; // Get list of songs.
              return ListView.builder(
                itemCount: songs.length,
                itemBuilder: (BuildContext context, int index) {
                  final song = songs[index]; // Get current song.
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.music_note), // Optionally display an icon.
                        title: Row(
                          children: [
                            Text(
                              song.name ?? 'Unknown', // Display song name.
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8), // Spacer.
                            Text(
                              '(${_formatDuration(song.duration ?? 0)})', // Display formatted duration.
                            ),
                          ],
                        ),
                        subtitle: Text(
                          song.artist?.name ?? 'Unknown Artist', // Display artist name.
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }

  // Function to format song duration.
  String _formatDuration(int durationInSeconds) {
    Duration duration =
        Duration(seconds: durationInSeconds); // Convert duration to Duration object.
    String minutes = (duration.inMinutes % 60).toString().padLeft(2, '0'); // Calculate minutes.
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0'); // Calculate seconds.
    return '$minutes:$seconds'; // Return formatted duration string.
  }
}
