import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player/features/music_player/data/models/playlist_model.dart';
import 'package:music_player/features/music_player/data/repositories/music_repositories.dart';

class MusicPlaylistProvider with ChangeNotifier {
  MusicRepository musicRepository;

  MusicPlaylistProvider({required this.musicRepository});

  List<PlaylistModel> playlist = [];
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
  void addPlaylist(String playlistName, PlaylistModel playlistModel) async {
    await musicRepository.addPlaylist(playlistName, playlistModel);
    notifyListeners();
  }

  void addList() {
    FilePicker.platform.getDirectoryPath().then((value) {
      String value2 = value ?? '';
      playlist.add(PlaylistModel(title: value2.split('/').last, path: value2));
      notifyListeners();
    });
  }

  // add musics to playlist
  void addMusicToPlaylist(String playlistName, List<Audio> musics) async {
    await musicRepository.addMusics(playlistName, musics);
    notifyListeners();
  }
}
