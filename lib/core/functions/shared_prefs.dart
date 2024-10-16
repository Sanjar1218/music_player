import 'dart:convert';
import 'dart:io';

import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:music_player/di.dart';
import 'package:music_player/models/music_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static String musicKey = "musics";

  static Future<void> saveMusic(List<String> musics) async {
    String jsonString = jsonEncode(musics);
    await locator<SharedPreferences>().setString(musicKey, jsonString);
  }

  static Future<List<MusicModel>> getMusics() async {
    try {
      String? jsonString = locator<SharedPreferences>().getString(musicKey);
      if (jsonString == null) {
        return [];
      }

      List<dynamic> json = jsonDecode(jsonString);
      List<MusicModel> musics = [];
      for (String path in json) {
        try {
          var meta = await MetadataRetriever.fromFile(File(path));
          musics.add(MusicModel.fromMetadata(meta));
        } catch (e) {
          continue;
        }
      }
      return musics;
    } catch (e) {
      return [];
    }
  }
}
