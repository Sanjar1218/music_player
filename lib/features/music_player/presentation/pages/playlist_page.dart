import 'dart:io';

// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:music_player/features/music_player/presentation/pages/playing_page.dart';
import 'package:music_player/features/music_player/presentation/widgets/playlist_card.dart';
import 'package:collection/collection.dart';

import '../widgets/list_card.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<PlaylistCard> children = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: getFolders, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListCards(
        title: 'asdf',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const PlayingPage(audios: []);
              },
            ),
          );
        },
        children: children,
      ),
    );
  }

  void getFolders() {
    FilePicker.platform.getDirectoryPath().then((value) async {
      var files = await getFiles(value ?? '');
      print(files);
      setState(() {
        children = files
            .mapIndexed(
              (index, e) => PlaylistCard(
                title: e.metas.title ?? 'Unknown',
                imgPath: e.metas.extra?['image'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlayingPage(audios: files, index: index);
                      },
                    ),
                  );
                },
              ),
            )
            .toList();
      });
    });
  }

  Future<List<Audio>> getFiles(String path) async {
    var systemTempDir = Directory(path);

    List<Audio> files = [];
    await for (var entity in systemTempDir.list(recursive: true, followLinks: false)) {
      // get only mp3 files
      if (entity.path.endsWith('.mp3')) {
        print(entity.path);
        final metadata = await MetadataRetriever.fromFile(File(entity.path));
        print(metadata.toJson());
        files.add(
          Audio.file(
            entity.path,
            metas: Metas(
              title: metadata.albumArtistName ?? entity.path.split('/').last,
              artist: metadata.authorName,
              album: metadata.albumName,
              extra: {'image': metadata.albumArt},
            ),
          ),
        );
      }
    }
    return files;
  }
}
