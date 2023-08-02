import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player/features/music_player/data/repositories/music_repositories.dart';

class MusicPlaylistProvider with ChangeNotifier {
  MusicRepository musicRepository;

  MusicPlaylistProvider({required this.musicRepository});

  List<String> playlist = [];
  List<Audio> musics = [];

  // get musics from playlist
  void getMusics(String playlistName) async {
    musics = await musicRepository.getMusics(playlistName) ?? [];
    notifyListeners();
  }

  void getPlaylist() async {
    playlist = await musicRepository.getPlaylists();
    notifyListeners();
  }

  // add playlist
  void addPlaylist(String playlistName) async {
    await musicRepository.addPlaylist(playlistName);
    notifyListeners();
  }

  // add musics to playlist
  void addMusicToPlaylist(String playlistName, List<Audio> musics) async {
    await musicRepository.addMusics(playlistName, musics);
    notifyListeners();
  }
}
