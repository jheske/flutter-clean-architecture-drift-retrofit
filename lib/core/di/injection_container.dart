import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/local/database/app_database.dart';
import '../../data/remote/music_api_service.dart';
import '../../data/repository/music_repository.dart';
import '../../data/repository/music_repository_impl.dart';

///
/// serviceLocator code adapted from this [SO answer](https://stackoverflow.com/a/76085459/5277309).
///

// Declaration of a singleton instance of GetIt for dependency injection.
final GetIt serviceLocator = GetIt.instance;

/// Function to initialize the service locator with required dependencies asynchronously.
Future<void> initializeServiceLocator() async {
  // Registering Dio instance as a singleton for making HTTP requests.
  serviceLocator.registerSingleton<Dio>(Dio());

  // Registering MusicApiService with the provided Dio instance.
  serviceLocator.registerSingleton<MusicApiService>(MusicApiService(serviceLocator()));

  // Initializing database connection and registering the instance.
  AppDatabase database = await _openDatabaseConnection();
  serviceLocator.registerSingleton<AppDatabase>(database);

  // Initializing repository and registering the instance.
  MusicRepositoryImpl repository = await _openRepository();
  serviceLocator.registerSingleton<Repository>(repository);
}

/// Generic function to retrieve an instance of a registered type from the service locator.
T get<T extends Object>() {
  return serviceLocator.get<T>();
}

/// Function to lazily register a singleton instance.
registerLazySingleton<T extends Object>(T Function() function) {
  serviceLocator.registerLazySingleton<T>(function);
}

/// Function to open a database connection asynchronously.
Future<AppDatabase> _openDatabaseConnection() async {
  return AppDatabase(); // Placeholder for opening database connection.
}

/// Function to open a music repository asynchronously.
Future<MusicRepositoryImpl> _openRepository() async {
  return MusicRepositoryImpl(
      serviceLocator(), serviceLocator()); // Placeholder for opening repository.
}
