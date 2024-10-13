import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query_forked/on_audio_query.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MusicsPage extends StatelessWidget {
  const MusicsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Musics"),
      ),
      body: const Center(
        child: Text("Musics page"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.music_note),
        onPressed: () async {
          final OnAudioQuery _audioQuery = OnAudioQuery();
          List<SongModel> audios = await _audioQuery.querySongs();
          // print all audios
          audios.forEach((element) {
            print(element.title);
          });
        },
      ),
    );
  }
}
