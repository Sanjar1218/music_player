import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/api_clients/music_api_client.dart';
import 'package:music_player/blocs/music_bloc/music_bloc.dart';
import 'package:music_player/blocs/playing_bloc/playing_bloc.dart';
import 'package:music_player/repositories/music_repository.dart';

GetIt locator = GetIt.instance;

void init() {
  locator.registerSingleton(AudioPlayer());

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
  locator.registerSingleton(
    PlayingBloc(player: locator()),
  );
}
