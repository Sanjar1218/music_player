import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/blocs/playing_bloc/playing_state.dart';
import 'package:music_player/models/music_model.dart';

class PlayingBloc extends Cubit<PlayingState> {
  final AudioPlayer player;
  PlayingBloc({
    required this.player,
  }) : super(PlayingInitial());

  void getFile(MusicModel music) {
    if (music.filePath != null) {
      player.setFilePath(music.filePath!);
    } else if (music.url != null) {
      player.setUrl(music.url!);
    } else {
      emit(PlayingError(message: 'File not found'));
    }

    player.durationStream.listen((event) {
      emit(MusicPlaying(
        duration: event,
        position: player.position,
        isPlaying: player.playing,
      ));
    });

    player.positionStream.listen((event) {
      emit(MusicPlaying(
        duration: player.duration,
        position: event,
        isPlaying: player.playing,
      ));
    });
  }

  void play() {
    player.play();

  }

  void pause() {
    player.pause();
  }

  void stop() {
    player.stop();
  }

  void seek(Duration position) {
    player.seek(position);
  }

  void dispose() {
    player.dispose();
    super.close();
  }

  void setVolume(double volume) {
    player.setVolume(volume);
  }

  void setSpeed(double speed) {
    player.setSpeed(speed);
  }

  void setLoopMode(LoopMode loopMode) {
    player.setLoopMode(loopMode);
  }

  void setShuffleModeEnabled(bool enabled) {
    player.setShuffleModeEnabled(enabled);
  }
}
