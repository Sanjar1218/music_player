import 'package:flutter/cupertino.dart';

class MusicPlayingProvider with ChangeNotifier{
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  void changeIsPlaying(bool value){
    _isPlaying = value;
    notifyListeners();
  }
}