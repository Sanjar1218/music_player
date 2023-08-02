import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';

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
