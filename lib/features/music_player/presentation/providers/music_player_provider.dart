import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

class MusicPlayingProvider with ChangeNotifier {
  final AssetsAudioPlayer assetsAudioPlayer;
  final CarouselController carouselController;

  MusicPlayingProvider({
    required this.assetsAudioPlayer,
    required this.carouselController,
  });

  int second = 0;
  double range = 0;
  double wholeRange = 0;
  bool isPlaying = false;
  String time = '--:--';
  String lastTime = '--:--';

  double volumeValue = 0.5;

  void init(List<Audio>? audios, {int? index}) {
    assetsAudioPlayer.open(
      Playlist(audios: audios, startIndex: index ?? 0),
    );

    assetsAudioPlayer.currentPosition.listen(
      (event) {
        if (event.inSeconds == second) return;

        range = event.inSeconds.toDouble();
        time = ('${event.inMinutes.toString().padLeft(2, '0')}:${(event.inSeconds % 60).toString().padLeft(2, '0')}');
        notifyListeners();
        second = event.inSeconds;
      },
      onDone: () {
        range = 0;
        time = '--:--';
        notifyListeners();
      },
    );
    assetsAudioPlayer.playlistFinished.listen((event) {
      if (event) {
        range = 0;
        isPlaying = false;
        time = '00:00';
        notifyListeners();
      }
    });
    assetsAudioPlayer.current.listen((event) {
      isPlaying = true;
      lastTime = ('${assetsAudioPlayer.current.value?.audio.duration.inMinutes.toString().padLeft(2, '0')}:${(assetsAudioPlayer.current.value!.audio.duration.inSeconds % 60).toString().padLeft(2, '0')}');
      wholeRange = assetsAudioPlayer.current.value!.audio.duration.inSeconds.toDouble();
    });

    assetsAudioPlayer.volume.listen((event) {
      volumeValue = event;
      notifyListeners();
    });
  }

  void sliderValue(value) {
    range = value;
    notifyListeners();
    assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
  }

  void previousPage() {
    assetsAudioPlayer.previous();
    carouselController.previousPage();
  }

  void playOrPause() {
    assetsAudioPlayer.playOrPause();
    isPlaying = !isPlaying;
    notifyListeners();
  }

  void nextPage() {
    assetsAudioPlayer.next();
    carouselController.nextPage();
  }

  void volume(double value) {
    assetsAudioPlayer.setVolume(value);
    notifyListeners();
  }

  void loop() {
    print('loop');
    assetsAudioPlayer.toggleLoop();
  }

  void shuffle() {
    print('shuffle');
    assetsAudioPlayer.toggleShuffle();
  }
}
