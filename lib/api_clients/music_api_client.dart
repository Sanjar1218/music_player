import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:music_player/core/functions/bot_api.dart';
import 'package:music_player/core/functions/shared_prefs.dart';
import 'package:music_player/models/music_model.dart';

class MusicApiClientRemote {
  Future<List<MusicModel>> fetchMusic(List<String> fielIds) async {
    // TODO: Fetch music from local storage
    for (String fileId in fielIds) {
      var response = await BotApi.getAudio(fileId: fileId);
      print(response.data);
    }
    return [];
  }

  Future<List<String>> sendMusic(List<MusicModel> musicPaths) async {
    // Send music to remote storage
    List<String> fileIds = [];

    for (MusicModel music in musicPaths) {
      var response = await BotApi.sendAudio(
        chatId: 0,
        audio: music.filePath,
        caption: music.trackName,
      );

      fileIds.add(response.data['result']['audio']['file_id']);
    }
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
