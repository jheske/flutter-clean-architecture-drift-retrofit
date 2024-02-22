import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/domain/entity/user_entity.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserEntity>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username), // No explicit style, uses default title style
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
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
                    Text('Id:', style: theme.textTheme.titleMedium),
                    const SizedBox(width: 10),
                    Text(user.id.toString()),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('Music Style:', style: theme.textTheme.titleMedium),
                    const SizedBox(width: 10),
                    Text(user.musicStyle ?? 'none')
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('Favorite Song:', style: theme.textTheme.titleMedium),
                    const SizedBox(width: 10),
                    Text(user.favoriteSongName ?? 'none')
                  ],
                ),
              ],
            ),
          ),

          // Playlist title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Playlist', style: theme.textTheme.titleLarge),
          ),
          // ListView to display songs
          Expanded(
            child: ListView.builder(
              itemCount: user.playlist?.songs.length ?? 0,
              itemBuilder: (context, index) {
                final song = user.playlist!.songs[index];
                return ListTile(
                  title: Text(song.name ?? 'Unknown'),
                  subtitle: Text('Artist: ${song.artist?.name ?? "Unknown"}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
