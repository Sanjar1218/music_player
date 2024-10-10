class PlaylistModel {
  final String title;
  final String path;

  PlaylistModel({required this.title, required this.path});

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(title: json['title'], path: json['path']);
  }

  Map toJson() {
    return {
      'title': title,
      'path': path,
    };
  }
}
