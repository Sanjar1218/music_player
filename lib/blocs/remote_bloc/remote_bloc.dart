// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/blocs/remote_bloc/remote_state.dart';
import 'package:music_player/models/music_model.dart';
import 'package:music_player/repositories/music_repository.dart';

class RemoteBloc extends Cubit<RemoteState> {
  MusicRepository musicRepository;
  RemoteBloc({required this.musicRepository}) : super(RemoteInitial());

  void getRemote() async {
    try {
      final music = await musicRepository.downloadMusic();
      emit(RemoteLoaded(music: music.first));
    } catch (e) {
      emit(RemoteError(message: e.toString()));
    }
  }

  Future<String?> uploadRemote(MusicModel music) async {
    emit(RemoteLoading());
    try {
       await musicRepository.uploadMusics([music]);
      emit(RemoteLoaded(music: music));
      return null;
    } catch (e) {
      print(e);
      emit(RemoteError(message: e.toString()));
      return e.toString();
    }
  }
}