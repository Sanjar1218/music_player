import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PlayingPage extends StatefulWidget {
  const PlayingPage({super.key});

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  int second = 0;
  double range = 0;
  double wholeRange = 0;
  bool isPlaying = false;
  String time = '--:--';
  String lastTime = '--:--';

  @override
  void initState() {
    assetsAudioPlayer
        .open(
      Audio("assets/audios/summer.mp3"),
      autoStart: false,
    )
        .then((value) {
      lastTime = ('${assetsAudioPlayer.current.value?.audio.duration.inMinutes.toString().padLeft(2, '0')}:${(assetsAudioPlayer.current.value!.audio.duration.inSeconds % 60).toString().padLeft(2, '0')}');
      wholeRange = assetsAudioPlayer.current.value!.audio.duration.inSeconds.toDouble();
    });
    assetsAudioPlayer.currentPosition.listen((event) {
      if (event.inSeconds == second) return;
      setState(() {
        range = event.inSeconds.toDouble();
        time = ('${event.inMinutes.toString().padLeft(2, '0')}:${(event.inSeconds % 60).toString().padLeft(2, '0')}');
      });
      second = event.inSeconds;
    });
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Playing', style: TextStyle(color: Color(0xFF091227), fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          CarouselSlider(
            options: CarouselOptions(height: 260.0, aspectRatio: 14 / 16, viewportFraction: 0.75, clipBehavior: Clip.none),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(child: Image.asset('assets/images/Covers.png', width: 100, height: 100, scale: 0.5)),
                      const Positioned(
                        bottom: -70,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Believer', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF081027), fontSize: 24, fontWeight: FontWeight.w700)),
                            Text('IMAGINE DRAGON', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFF8995B8), fontSize: 16, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.favorite_outline),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.volume_mute_sharp),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.repeat),
                    SizedBox(width: 20),
                    Icon(Icons.shuffle),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(time),
                Text(lastTime),
              ],
            ),
          ),
          Slider(
            value: range,
            min: 0,
            max: wholeRange,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            thumbColor: Colors.black,
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onChanged: (value) {
              setState(() {
                range = value;
              });
              assetsAudioPlayer.seek(Duration(seconds: value.toInt()));
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: () {}, child: const Icon(Icons.skip_previous_outlined, size: 60)),
              InkWell(
                  onTap: () {
                    assetsAudioPlayer.playOrPause();
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  // ignore: dead_code
                  child: isPlaying ? const Icon(Icons.pause_outlined, size: 60) : const Icon(Icons.play_arrow_outlined, size: 60)),
              const Icon(Icons.skip_next_outlined, size: 60),
            ],
          )
        ],
      ),
    );
  }
}
