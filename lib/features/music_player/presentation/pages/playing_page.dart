import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/features/music_player/presentation/providers/music_player_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/carousel_slider.dart';

class PlayingPage extends StatefulWidget {
  final List<Audio>? audios;
  final int? index;

  const PlayingPage({
    super.key,
    this.audios,
    this.index,
  });

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  @override
  void initState() {
    Provider.of<MusicPlayingProvider>(context, listen: false).init(widget.audios, index: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Playing', style: TextStyle(color: Color(0xFF091227), fontSize: 20, fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: Consumer<MusicPlayingProvider>(
        builder: (context, playing, child) {
          return Column(
            children: [
              const SizedBox(height: 30),
              CarouselCustom(carouselController: playing.carouselController, assetsAudioPlayer: playing.assetsAudioPlayer, audios: widget.audios),
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
                  children: [Text(playing.time), Text(playing.lastTime)],
                ),
              ),
              Slider(
                value: playing.range,
                max: playing.wholeRange,
                activeColor: Colors.black,
                inactiveColor: Colors.grey,
                thumbColor: Colors.black,
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                onChanged: playing.sliderValue,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(onTap: playing.previousPage, child: const Icon(Icons.skip_previous_outlined, size: 60)),
                  InkWell(onTap: playing.playOrPause, child: playing.isPlaying ? const Icon(Icons.pause_outlined, size: 60) : const Icon(Icons.play_arrow_outlined, size: 60)),
                  InkWell(onTap: playing.nextPage, child: const Icon(Icons.skip_next_outlined, size: 60)),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
