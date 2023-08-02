// ignore: import_of_legacy_library_into_null_safe

// ignore: import_of_legacy_library_into_null_safe
import 'package:get_it/get_it.dart';
import 'package:music_player/features/music_player/data/datasources/music_local_datasource.dart';
import 'package:music_player/features/music_player/data/repositories/music_repositories.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/music_player/presentation/providers/music_playlist_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Music Player
  // provider
  sl.registerFactory(
    () => MusicPlaylistProvider(musicRepository: sl()),
  );


  // Repository
  sl.registerLazySingleton<MusicRepository>(
    () => MusicRepository(
      musicLocalDatasource: sl(),
    
    ),
  );

  // Data sources
  sl.registerLazySingleton<MusicLocalDatasource>(
    () => MusicLocalDatasource(sharedPreferences: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
