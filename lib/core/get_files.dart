import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<List<String>> getFiles() async {
  var path = await FilePicker.platform.getDirectoryPath();

  Directory directory = Directory(path ?? "");
  List<FileSystemEntity> files = directory.listSync(recursive: true, followLinks: false);
  List<String> paths = [];
  for (FileSystemEntity file in files) {
    if (file.path.endsWith(".mp3")) {
      paths.add(file.path);
    }
  }

  return paths;
}
