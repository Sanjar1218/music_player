import 'package:assets_audio_player/assets_audio_player.dart';

extension AudioExtension on Audio {
  String get title => metas.title ?? path.split('/').last;
  String get artist => metas.artist ?? '';
  String get album => metas.album ?? '';
  String get imgPath => metas.extra?['image'] ?? '';
  String get path => this.path;

  // fromJson
  static Audio fromJson(Map<String, dynamic> json) {
    return Audio.file(
      json['path'],
      metas: Metas(
        title: json['title'],
        artist: json['artist'],
        album: json['album'],
        extra: {'image': json['imgPath']},
      ),
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'artist': artist,
      'album': album,
      'imgPath': imgPath,
      'path': path,
    };
  }
}

class MusicModel {
  final int? id;
  final String? title;
  final String? artist;
  final String? album;
  final String? imgPath;
  final String? path;

  MusicModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.imgPath,
    required this.path,
  });

  
}
