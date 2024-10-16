import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:music_player/core/functions/shared_prefs.dart';
import 'package:music_player/models/music_model.dart';

class MusicApiClientRemote {
  Future<List<MusicModel>> fetchMusic() async {
    // Fetch music from local storage
    return [];
  }
}

class MusicApiClientLocal {

  Future<List<MusicModel>> fetchMusic() async {
    var path = await FilePicker.platform.getDirectoryPath();

    Directory directory = Directory(path ?? "");
    List<FileSystemEntity> files = directory.listSync(recursive: true, followLinks: false);
    List<String> filePaths = [];
    List<MusicModel> musics = [];
    for (FileSystemEntity file in files) {
      if (file.path.endsWith(".mp3") || file.path.endsWith(".m4a")) {
        filePaths.add(file.path);
        try {
          Metadata meta = await MetadataRetriever.fromFile(File(file.path));
          musics.add(MusicModel.fromMetadata(meta));
        } catch (e) {
          continue;
        }
      }
    }

    // save music using sharedpreferences
    SharedPrefs.saveMusic(filePaths);

    return musics;
  }

  Future<List<MusicModel>> loadMusic() async {
    List<MusicModel> paths = await SharedPrefs.getMusics();
    print(paths);
    return paths;
  }
}
