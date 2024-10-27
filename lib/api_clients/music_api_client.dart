import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:music_player/core/functions/bot_api.dart';
import 'package:music_player/core/functions/shared_prefs.dart';
import 'package:music_player/models/music_model.dart';
import 'package:permission_handler/permission_handler.dart';

class MusicApiClientRemote {
  Future<List<MusicModel>> fetchMusic() async {
    List<String> fielIds = await SharedPrefs.getFileIds();

    for (String fileId in fielIds) {
      var response = await BotApi.getAudio(fileId: fileId);
    }
    return [];
  }

  Future<void> sendMusic(List<MusicModel> musicPaths) async {
    int? chatId = await SharedPrefs.getChatId();
    // Send music to remote storage
    List<String> fileIds = [];

    for (MusicModel music in musicPaths) {
      var response = await BotApi.sendAudio(
        chatId: chatId ?? 0,
        audio: music.filePath,
        caption: music.trackName,
      );
      fileIds.add(response.data['result']['audio']['file_id']);
    }
    // save fileIds using sharedpreferences
    SharedPrefs.saveFielsIds(fileIds);
  }
}

class MusicApiClientLocal {
  Future<List<MusicModel>> fetchMusic() async {
    var permissionStatus = await Permission.storage.status;
    print(permissionStatus);
    // ask for permission to access storage
    if (permissionStatus == PermissionStatus.denied) {
      await Permission.manageExternalStorage.request();
    }
    print(permissionStatus);
    var path = await FilePicker.platform.getDirectoryPath();

    Directory directory = Directory(path ?? "");
    print(directory.path);
    List<FileSystemEntity> files = directory.listSync();
    print(files.length);
    print(files);
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
    return paths;
  }
}
