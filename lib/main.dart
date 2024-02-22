import 'dart:convert';

import 'package:drift_local_database_example/core/di/injection_container.dart';
import 'package:drift_local_database_example/core/router_config.dart';
import 'package:drift_local_database_example/data/domain/entity/song_entity.dart';
import 'package:drift_local_database_example/data/model/model_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:provider/provider.dart';

import 'data/domain/entity/artist_entity.dart';
import 'data/domain/entity/user_entity.dart';
import 'data/repository/music_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Ensure that the service locator is initialized so entities can retrieve instances as follows:
  //
  // ```dart
  // AppDatabase database = serviceLocator.get<AppDatabase>();
  // AppDatabase repository = serviceLocator.get<DatabaseRepository>();
  // ```
  await initializeServiceLocator();

  final themeStr =
      await rootBundle.loadString('assets/themes/app_painter_theme_F44336_redorange_light.json');
  final themeJson = json.decode(themeStr);

  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  final repository = serviceLocator.get<Repository>();

  repository.clearDatabase();
  final music = await repository.fetchMusic();
  music.saveToDatabase();

  runApp(MyApp(theme: theme));
}

class MyApp extends StatefulWidget {
  final ThemeData theme;

  const MyApp({super.key, required this.theme});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ArtistEntity()),
        Provider(create: (context) => UserEntity()),
        Provider(create: (context) => SongEntity()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Clean Architecture App with Retrofit, Drift and Freezed.',
        theme: widget.theme,
        routerConfig: appRouter,
      ),
    );
  }
}
