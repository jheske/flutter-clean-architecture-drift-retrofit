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

// Import statements for required packages and files.
import 'package:clean_architecture_with_database/screens/database_viewer_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/artist_screen.dart';
import '../screens/artists_screen.dart';
import '../screens/home_screen.dart';
import '../screens/songs_screen.dart';
import '../screens/user_screen.dart';
import '../screens/users_screen.dart';

// Define the application router using GoRouter.
final appRouter = GoRouter(
  initialLocation: '/', // Set the initial location of the router.
  routes: <RouteBase>[
    // Define a list of routes.
    // Route for the home screen.
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) =>
          const HomeScreen(), // Build the HomeScreen when this route is matched.
    ),
    // Route for the users screen.
    GoRoute(
      name: 'users',
      path: '/users',
      builder: (context, state) =>
          const UsersScreen(), // Build the UsersScreen when this route is matched.
    ),
    // Route for the artists screen.
    GoRoute(
      name: 'artists',
      path: '/artists',
      builder: (context, GoRouterState state) {
        return const ArtistsScreen(); // Build the ArtistsScreen when this route is matched.
      },
    ),
    // Route for the songs screen.
    GoRoute(
      name: 'songs',
      path: '/songs',
      builder: (context, GoRouterState state) {
        return const SongsScreen(); // Build the SongsScreen when this route is matched.
      },
    ),
    // Route for the artist screen.
    GoRoute(
      name: 'artist',
      path: '/artist',
      builder: (context, GoRouterState state) {
        return const ArtistScreen(); // Build the ArtistScreen when this route is matched.
      },
    ),
    // Route for the user screen with dynamic parameters id and name.
    GoRoute(
      name: 'user',
      path: '/user/:id/:name',
      builder: (context, GoRouterState state) {
        return const UserScreen(); // Build the UserScreen when this route is matched.
      },
    ),
    // Route for the database view screen.
    GoRoute(
      name: 'database-view',
      path: '/database-view',
      builder: (context, state) {
        // Implement the screen for viewing the database here.
        // You can use the DatabaseViewer widget or any custom implementation.
        return DatabaseViewsScreen(); // Build the DatabaseViewsScreen when this route is matched.
      },
    ),
  ],
);
