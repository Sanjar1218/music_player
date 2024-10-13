import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';

Future<List<Metadata>> getFiles() async {
  var path = await FilePicker.platform.getDirectoryPath();

  Directory directory = Directory(path ?? "");
  List<FileSystemEntity> files = directory.listSync(recursive: true, followLinks: false);
  List<Metadata> paths = [];
  for (FileSystemEntity file in files) {
    if (file.path.endsWith(".mp3") || file.path.endsWith(".m4a")) {
      try{
      Metadata meta = await MetadataRetriever.fromFile(File(file.path));
      paths.add(meta);
      } catch (e) {
        continue;
      }
    }
  }

  return paths;
}
