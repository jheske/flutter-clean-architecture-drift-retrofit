import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/di/injection_container.dart';
import '../data/local/database/app_database.dart';
import '../data/repository/music_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final database = serviceLocator.get<AppDatabase>();
  final repository = serviceLocator.get<Repository>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter with Drift and Retrofit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push('/users');
              },
              icon: const Icon(Icons.person),
              label: const Text('Users'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push('/artists');
              },
              icon: const Icon(Icons.mic),
              label: const Text('Artists'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push('/songs');
              },
              icon: const Icon(Icons.music_note),
              label: const Text('Songs'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push('/database-view');
              },
              icon: const Icon(Icons.data_array),
              label: const Text('Database View'),
            ),
          ],
        ),
      ),
    );
  }
}
