import 'package:get_it/get_it.dart';
import 'package:music_player/api_clients/music_api_client.dart';
import 'package:music_player/bloc/music_bloc.dart';
import 'package:music_player/repositories/music_repository.dart';

GetIt locator = GetIt.instance;

void init() {
  locator.registerSingleton(MusicApiClientLocal());
  locator.registerSingleton(MusicApiClientRemote());

  locator.registerSingleton(
    MusicRepository(
      musicApiClientLocal: locator(),
      musicApiClientRemote: locator(),
    ),
  );

  locator.registerSingleton(
    MusicCubit(musicRepository: locator()),
  );
}
