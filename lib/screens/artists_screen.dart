import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../core/di/injection_container.dart';
import '../data/domain/entity/artist_entity.dart';
import '../data/repository/music_repository.dart';

class ArtistsScreen extends StatefulWidget {
  const ArtistsScreen({super.key});

  @override
  State<ArtistsScreen> createState() => _ArtistsScreenState();
}

class _ArtistsScreenState extends State<ArtistsScreen> {
  final _repository = serviceLocator<Repository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artists'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: FutureBuilder(
        future: _repository.getArtists(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final artists = snapshot.data as List<ArtistEntity>;
              return ListView.builder(
                itemCount: artists.length,
                itemBuilder: (BuildContext context, int index) {
                  final artist = artists[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<ArtistEntity>(context, listen: false).setArtist(artist);
                        GoRouter.of(context).push('/artist');
                      },
                      child: Text(artist.name ?? ''),
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
}
