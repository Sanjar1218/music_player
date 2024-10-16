import 'package:music_player/api_clients/music_api_client.dart';
import 'package:music_player/models/music_model.dart';

class MusicRepository {
  final MusicApiClientLocal musicApiClientLocal;
  final MusicApiClientRemote musicApiClientRemote;

  MusicRepository({
    required this.musicApiClientLocal,
    required this.musicApiClientRemote,
  });

  Future<List<MusicModel>> fetchMusics() async {
    final localMusics = await musicApiClientLocal.fetchMusic();
    // final remoteMusics = await musicApiClientRemote.fetchMusic();

    return [
      ...localMusics,
      // ...remoteMusics,
    ];
  }

  Future<List<MusicModel>> loadMusic() async {
    final localMusics = await musicApiClientLocal.loadMusic();
    // final remoteMusics = await musicApiClientRemote.loadMusic();

    return [
      ...localMusics,
      // ...remoteMusics,
    ];
  }
}
