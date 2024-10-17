import 'package:music_player/models/music_model.dart';

abstract class RemoteState {}

class RemoteInitial extends RemoteState {}

class RemoteLoading extends RemoteState {}

class RemoteLoaded extends RemoteState {
  final MusicModel music;
  RemoteLoaded({required this.music});
}

class RemoteError extends RemoteState {
  final String message;
  RemoteError({required this.message});
}