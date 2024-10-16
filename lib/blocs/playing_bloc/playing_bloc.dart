import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/blocs/playing_bloc/playing_state.dart';
import 'package:music_player/models/music_model.dart';

class PlayingBloc extends Cubit<PlayingState> {
  final AudioPlayer player;
  PlayingBloc({
    required this.player,
  }) : super(PlayingInitial());

  void getFile(List<MusicModel> music, int index) {
    final playList = ConcatenatingAudioSource(
      children: music.map((e) => AudioSource.file(e.filePath!)).toList(),
    );

    player.setAudioSource(playList, initialIndex: index);

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

  void next() {
    if (player.hasNext) {
      player.seekToNext();
    } else {
      player.seek(const Duration(seconds: 0), index: 0);
    }
  }

  void previous() {
    if (player.hasPrevious) {
      player.seekToPrevious();
    } else {
      player.seek(const Duration(seconds: 0), index: (player.effectiveIndices ?? [0]).last);
    }
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
