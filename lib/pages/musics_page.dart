
import 'package:flutter/material.dart';
import 'package:music_player/core/get_files.dart';

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
        onPressed: () async {
          var lst = await getFiles();

          for (var path in lst) {
            print('Track Name: ${path.trackName}');
          }
        },
        child: Icon(Icons.music_note),
      ),
    );
  }
}
