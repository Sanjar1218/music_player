import 'package:music_player/models/music_model.dart';


abstract class MusicState {}

class MusicInitial extends MusicState {}

class Musicloaded extends MusicState {
  final List<MusicModel> musics;
  Musicloaded({required this.musics});
}

class MusicError extends MusicState {
  final String message;
  MusicError({required this.message});
}
