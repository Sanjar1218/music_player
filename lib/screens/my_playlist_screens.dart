import 'package:flutter/material.dart';
import 'package:music_player/models/main_model.dart';
import 'package:music_player/widgets/music_item.dart';

import '../data/data.dart';
import 'category_songs_screens.dart';

class MyPlaylistScreens extends StatefulWidget {
  final Function func;
  const MyPlaylistScreens({super.key, required this.func});

  @override
  State<MyPlaylistScreens> createState() => _MyPlaylistScreensState();
}

class _MyPlaylistScreensState extends State<MyPlaylistScreens> {
  @override
  Widget build(BuildContext context) {
    List<Music> MusicList = musicList.reversed.toList();
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
                      title: "My Playlist",
                    ),
                  ));
            },
            child: Text(
              "My Playlist",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500,color: Colors.black),
            ),
          ),
        ),
        Container(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MusicItem(
                func: widget.func,
                music: MusicList[index],
              );
            },
            itemCount: musicList.length,
          ),
        ),
      ],
    );
  }
}
