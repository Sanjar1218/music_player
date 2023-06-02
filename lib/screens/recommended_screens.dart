import 'package:flutter/material.dart';
import 'package:music_player/data/data.dart';
import 'package:music_player/screens/category_songs_screens.dart';

import '../widgets/music_item.dart';

class RecommendedScreen extends StatefulWidget {
  final Function func;
  const RecommendedScreen({super.key, required this.func});

  @override
  State<RecommendedScreen> createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategorySongsScreen(
                      list: musicList,
                      title: "Recommended for you",
                    ),
                  ));
            },
            child: Text(
              "Recommended for you",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: Colors.black),
            ),
          ),
        ),
        Container(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MusicItem(func: widget.func, music: musicList[index]);
            },
            itemCount: musicList.length,
          ),
        ),
      ],
    );
  }
}
