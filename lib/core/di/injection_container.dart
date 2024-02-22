import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/local/database/app_database.dart';
import '../../data/remote/music_api_service.dart';
import '../../data/repository/music_repository.dart';
import '../../data/repository/music_repository_impl.dart';

///
/// serviceLocator code adapted from this SO answer:
/// https://stackoverflow.com/a/76085459/5277309
///
final GetIt serviceLocator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  // Dio
  serviceLocator.registerSingleton<Dio>(Dio());

  /// API service
  serviceLocator.registerSingleton<MusicApiService>(MusicApiService(serviceLocator()));

  /// Database.
  AppDatabase database = await _openDatabaseConnection();
  serviceLocator.registerSingleton<AppDatabase>(database);

  /// Repository
  MusicRepositoryImpl repository = await _openRepository();
  serviceLocator.registerSingleton<Repository>(repository);
}

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

registerLazySingleton<T extends Object>(T Function() function) {
  serviceLocator.registerLazySingleton<T>(function);
}

Future<AppDatabase> _openDatabaseConnection() async {
  return AppDatabase();
}

Future<MusicRepositoryImpl> _openRepository() async {
  return MusicRepositoryImpl(serviceLocator(), serviceLocator());
}
