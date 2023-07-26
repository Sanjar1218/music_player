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

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      id: json['id'],
      title: json['title'],
      artist: json['artist'],
      album: json['album'],
      imgPath: json['imgPath'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'imgPath': imgPath,
      'path': path,
    };
  }
}
