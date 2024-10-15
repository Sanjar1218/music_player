import 'package:music_player/models/music_model.dart';

abstract class PlayingState {}

class PlayingInitial extends PlayingState {}

class PlayingLoaded extends PlayingState {
  final MusicModel music;
  PlayingLoaded({
    required this.music,
  });
}

class MusicPlaying extends PlayingState {
  final Duration? duration;
  final Duration? position;
  final bool isPlaying;
  MusicPlaying({
    required this.duration,
    required this.position,
    required this.isPlaying,
  });
}

class PlayingError extends PlayingState {
  final String message;
  PlayingError({
    required this.message,
  });
}