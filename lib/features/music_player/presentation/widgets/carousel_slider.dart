import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselCustom extends StatelessWidget {
  const CarouselCustom({
    super.key,
    required this.carouselController,
    required this.assetsAudioPlayer,
    required this.audios,
  });

  final CarouselController carouselController;
  final AssetsAudioPlayer assetsAudioPlayer;
  final List<Audio>? audios;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 260.0,
        aspectRatio: 14 / 16,
        viewportFraction: 0.75,
        clipBehavior: Clip.none,
        onPageChanged: (index, reason) {
          assetsAudioPlayer.playlistPlayAtIndex(index);
        },
      ),
      items: (audios ?? []).map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(child: i.metas.extra?['image'] ?? Image.asset('assets/images/Covers.png', width: 100, height: 100, scale: 0.5)),
                Positioned(
                  bottom: -70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(i.metas.title ?? 'Title', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF081027), fontSize: 20, fontWeight: FontWeight.w700)),
                      ),
                      Text(i.metas.artist ?? 'Unknown', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF8995B8), fontSize: 16, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
