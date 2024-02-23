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

import '../data/domain/entity/user_entity.dart';

// This class represents the UserScreen, which is a StatelessWidget used to display
// information about a specific user. It contains a Scaffold with an AppBar and body
// content to show details about the user, including their ID, music style, favorite
// song, and playlist.

class UserScreen extends StatelessWidget {
  const UserScreen({super.key}); // Constructor for UserScreen.

  // Build method to construct the UI for UserScreen.
  @override
  Widget build(BuildContext context) {
    // Obtain user data from Provider.
    final user = Provider.of<UserEntity>(context);
    // Obtain theme data from context.
    final theme = Theme.of(context);

    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username), // Set app bar title to user's username.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon.
          onPressed: () {
            GoRouter.of(context).pop(); // Navigate back when the back arrow button is pressed.
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User information section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Id:', style: theme.textTheme.titleMedium), // Display user ID.
                    const SizedBox(width: 10), // Spacer.
                    Text(user.id.toString()), // Display user's ID.
                  ],
                ),
                const SizedBox(height: 10), // Spacer.
                Row(
                  children: [
                    Text('Music Style:',
                        style: theme.textTheme.titleMedium), // Display music style.
                    const SizedBox(width: 10), // Spacer.
                    Text(user.musicStyle ?? 'none') // Display user's music style.
                  ],
                ),
                const SizedBox(height: 10), // Spacer.
                Row(
                  children: [
                    Text('Favorite Song:',
                        style: theme.textTheme.titleMedium), // Display favorite song.
                    const SizedBox(width: 10), // Spacer.
                    Text(user.favoriteSongName ?? 'none') // Display user's favorite song.
                  ],
                ),
              ],
            ),
          ),

          // Playlist title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Playlist', style: theme.textTheme.titleLarge), // Display playlist title.
          ),
          // ListView to display songs in the user's playlist
          Expanded(
            child: ListView.builder(
              itemCount: user.playlist?.songs.length ?? 0,
              itemBuilder: (context, index) {
                final song = user.playlist!.songs[index];
                return ListTile(
                  title: Text(song.name ?? 'Unknown'), // Display song name.
                  subtitle:
                      Text('Artist: ${song.artist?.name ?? "Unknown"}'), // Display artist name.
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
