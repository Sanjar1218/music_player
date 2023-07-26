import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:music_player/features/music_player/data/models/music_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MusicLocalDatasource {
  final SharedPreferences sharedPreferences;

  MusicLocalDatasource({required this.sharedPreferences});

  Future<List<MusicModel>> getMusics() async {
    final musics = sharedPreferences.getStringList('musics');
    if (musics != null) {
      return musics.map((e) => MusicModel.fromJson(jsonDecode(e))).toList();
    } else {
      final musics = await _getMusicsFromJson();
      sharedPreferences.setStringList(
        'musics',
        musics.map((e) => jsonEncode(e.toJson())).toList(),
      );
      return musics;
    }
  }

  Future<List<MusicModel>> _getMusicsFromJson() async {
    final musics = await rootBundle.loadString('assets/json/musics.json');
    final musicsJson = jsonDecode(musics) as List;
    return musicsJson.map((e) => MusicModel.fromJson(e)).toList();
  }
}