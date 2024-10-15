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
}
