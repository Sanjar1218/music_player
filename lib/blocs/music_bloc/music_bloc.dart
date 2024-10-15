import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/blocs/music_bloc/music_state.dart';
import 'package:music_player/repositories/music_repository.dart';

class MusicCubit extends Cubit<MusicState> {
  MusicRepository musicRepository;
  MusicCubit({
    required this.musicRepository,
  }) : super(MusicInitial());

  void getMusics() async {
    try {
      emit(Musicloaded(musics: await musicRepository.fetchMusics()));
    } catch (e) {
      emit(MusicError(message: e.toString()));
    }
  }
}
