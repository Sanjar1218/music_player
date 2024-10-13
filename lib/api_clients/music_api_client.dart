import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
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
    List<MusicModel> paths = [];
    for (FileSystemEntity file in files) {
      if (file.path.endsWith(".mp3") || file.path.endsWith(".m4a")) {
        try {
          Metadata meta = await MetadataRetriever.fromFile(File(file.path));
          paths.add(MusicModel.fromMetadata(meta));
        } catch (e) {
          continue;
        }
      }
    }

    return paths;
  }
}
