import 'package:drift_local_database_example/screens/database_viewer_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/artist_screen.dart';
import '../screens/artists_screen.dart';
import '../screens/home_screen.dart';
import '../screens/songs_screen.dart';
import '../screens/user_screen.dart';
import '../screens/users_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      name: 'home',
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'users',
      path: '/users',
      builder: (context, state) => UsersScreen(),
    ),
    GoRoute(
      name: 'artists',
      path: '/artists',
      builder: (context, GoRouterState state) {
        return const ArtistsScreen();
      },
    ),
    GoRoute(
      name: 'songs',
      path: '/songs',
      builder: (context, GoRouterState state) {
        return const SongsScreen();
      },
    ),
    GoRoute(
      name: 'artist',
      path: '/artist',
      builder: (context, GoRouterState state) {
        return const ArtistScreen();
      },
    ),
    GoRoute(
      name: 'user',
      path: '/user/:id/:name',
      builder: (context, GoRouterState state) {
        return const UserScreen();
      },
    ),
    GoRoute(
      name: 'database-view',
      path: '/database-view',
      builder: (context, state) {
        // Implement the screen for viewing the database here
        // You can use the DatabaseViewer widget or any custom implementation
        return DatabaseViewsScreen();
      },
    ),
  ],
);
