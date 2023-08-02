import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/features/music_player/data/models/music_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicLocalDatasource {
  final SharedPreferences sharedPreferences;

  MusicLocalDatasource({required this.sharedPreferences});

  Future<List<Audio>?> getMusics(String playlistName) async {
    final musics = sharedPreferences.getStringList(playlistName);
    if (musics != null) {
      return musics.map((e) => AudioExtension.fromJson(jsonDecode(e))).toList();
    }
    return null;
  }

  // add music to playlist
  Future<void> addMusic(String playlistName, Audio music) async {
    final musics = sharedPreferences.getStringList('$playlistName.plt');
    if (musics != null) {
      musics.add(jsonEncode(music.toJson()));
      await sharedPreferences.setStringList(playlistName, musics);
    } else {
      await sharedPreferences.setStringList(playlistName, [jsonEncode(music.toJson())]);
    }
  }

  // add list of music to created playlist
  Future<void> addMusics(String playlistName, List<Audio> musics) async {
    final musicsJson = musics.map((e) => jsonEncode(e.toJson())).toList();
    await sharedPreferences.setStringList('$playlistName.plt', musicsJson);
  }

  // get all playlist
  Future<List<String>> getPlaylists() async {
    final playlists = sharedPreferences.getKeys();
    return playlists.where((element) => element.endsWith('.plt')).toList();
  }

  // delete playlist
  Future<void> deletePlaylist(String playlistName) async {
    await sharedPreferences.remove(playlistName);
  }
}
