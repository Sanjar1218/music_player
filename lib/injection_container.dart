// ignore: import_of_legacy_library_into_null_safe

// ignore: import_of_legacy_library_into_null_safe
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:music_player/features/music_player/data/datasources/music_local_datasource.dart';
import 'package:music_player/features/music_player/data/repositories/music_repositories.dart';
import 'package:music_player/features/music_player/presentation/providers/music_player_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/music_player/presentation/providers/music_playlist_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Music Player
  // provider
  sl.registerFactory(
    () => MusicPlaylistProvider(musicRepository: sl()),
  );

  sl.registerFactory(
    () => MusicPlayingProvider(
      assetsAudioPlayer: sl(),
      carouselController: sl(),
    ),
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
  final carouselController = CarouselController();
  final assetsAudioPlayer = AssetsAudioPlayer();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => carouselController);
  sl.registerLazySingleton(() => assetsAudioPlayer);
}
