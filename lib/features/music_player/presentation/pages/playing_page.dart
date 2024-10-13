import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PlayingPage extends StatelessWidget {
  const PlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Playing',
            style: TextStyle(
              color: Color(0xFF091227),
              fontSize: 20,
              fontWeight: FontWeight.w700,
            )),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('00:45'),
                Text('04:00'),
              ],
            ),
          ),
          Slider(
            value: 0.5,
            activeColor: Colors.black,
            inactiveColor: Colors.grey,
            thumbColor: Colors.black,
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.skip_previous_outlined, size: 60),
              // ignore: dead_code
              true ? Icon(Icons.pause_outlined, size: 60) : Icon(Icons.play_arrow),
              Icon(Icons.skip_next_outlined, size: 60),
            ],
          )
        ],
      ),
    );
  }
}
