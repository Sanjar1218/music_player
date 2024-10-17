import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/api_clients/music_api_client.dart';
import 'package:music_player/blocs/music_bloc/music_bloc.dart';
import 'package:music_player/blocs/playing_bloc/playing_bloc.dart';
import 'package:music_player/repositories/music_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

void init() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.telegram.org/bot${prefs.getString('botToken')}/',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  locator.registerSingleton(dio);
  locator.registerSingleton(prefs);

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
