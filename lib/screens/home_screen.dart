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
import '../data/local/database/app_database.dart';
import '../data/repository/music_repository.dart';

// This class represents the HomeScreen, which is a StatefulWidget used as the main
// screen of the application. It contains a Scaffold with an AppBar and body content
// to display buttons for navigating to different screens within the application.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Constructor for HomeScreen.

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // Create state for HomeScreen.
}

// State class for HomeScreen.
class _HomeScreenState extends State<HomeScreen> {
  // Database instance obtained from the service locator.
  final database = serviceLocator.get<AppDatabase>();
  // Repository instance obtained from the service locator.
  final repository = serviceLocator.get<Repository>();

  // Override initState method to perform initialization.
  @override
  void initState() {
    super.initState();
  }

  // Build method to construct the UI for HomeScreen.
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter with Drift and Retrofit'), // Set app bar title.
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button to navigate to the UsersScreen.
            ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push('/users'); // Navigate to UsersScreen.
              },
              icon: const Icon(Icons.person), // Icon for users.
              label: const Text('Users'), // Text for users.
            ),
            const SizedBox(height: 20), // Spacer.
            // Button to navigate to the ArtistsScreen.
            ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push('/artists'); // Navigate to ArtistsScreen.
              },
              icon: const Icon(Icons.mic), // Icon for artists.
              label: const Text('Artists'), // Text for artists.
            ),
            const SizedBox(height: 20), // Spacer.
            // Button to navigate to the SongsScreen.
            ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push('/songs'); // Navigate to SongsScreen.
              },
              icon: const Icon(Icons.music_note), // Icon for songs.
              label: const Text('Songs'), // Text for songs.
            ),
            const SizedBox(height: 20), // Spacer.
            // Button to navigate to the DatabaseViewsScreen.
            ElevatedButton.icon(
              onPressed: () {
                GoRouter.of(context).push('/database-view'); // Navigate to DatabaseViewsScreen.
              },
              icon: const Icon(Icons.data_array), // Icon for database view.
              label: const Text('Database View'), // Text for database view.
            ),
          ],
        ),
      ),
    );
  }
}
