import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/features/music_player/data/models/playlist_model.dart';

import '../datasources/music_local_datasource.dart';

class MusicRepository {
  final MusicLocalDatasource musicLocalDatasource;

  MusicRepository({required this.musicLocalDatasource});

  Future<List<Audio>?> getMusics(String playlistName) async {
    return await musicLocalDatasource.getMusics(playlistName);
  }

  Future<void> addMusic(String playlistName, Audio music) async {
    await musicLocalDatasource.addMusic(playlistName, music);
  }

  Future<void> addMusics(String playlistName, List<Audio> musics) async {
    await musicLocalDatasource.addMusics(playlistName, musics);
  }

  Future<List<PlaylistModel>> getPlaylists() async {
    return await musicLocalDatasource.getPlaylists();
  }

  Future<void> addPlaylist(String playlistName, String path) async {
    await musicLocalDatasource.addPlaylist(playlistName, path);
  }

  Future<void> deletePlaylist(String playlistName) async {
    await musicLocalDatasource.deletePlaylist(playlistName);
  }
}
