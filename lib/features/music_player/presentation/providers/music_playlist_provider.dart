import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_player/core/utils/get_files.dart';
import 'package:music_player/features/music_player/data/models/playlist_model.dart';
import 'package:music_player/features/music_player/data/repositories/music_repositories.dart';

class MusicPlaylistProvider with ChangeNotifier {
  MusicRepository musicRepository;

  MusicPlaylistProvider({required this.musicRepository});

  List<PlaylistModel> playlist = [];
  List<Audio> musics = [];

  // get musics from playlist
  Future<void> getMusics(String path) async {
    print(path);
    musics = await getFiles(path);
    print(musics);
    notifyListeners();
  }

  Future<void> getPlaylist() async {
    playlist = await musicRepository.getPlaylists();
    notifyListeners();
  }

  // add playlist
  Future<void> addPlaylist(String playlistName, String path) async {
    await musicRepository.addPlaylist(playlistName, path);
    notifyListeners();
  }

  void addList() {
    FilePicker.platform.getDirectoryPath().then((value) {
      if (value == null) return;

      String value2 = value;
      String name = value2.split('/').last;
      playlist.add(PlaylistModel(title: name, path: value2));
      musicRepository.addPlaylist(name, value2);
      notifyListeners();
    });
  }

  // add musics to playlist
  Future<void> addMusicToPlaylist(String playlistName, List<Audio> musics) async {
    await musicRepository.addMusics(playlistName, musics);
    notifyListeners();
  }
}
