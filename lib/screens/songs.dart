import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../data/data.dart';
import '../widgets/music_item.dart';
import 'category_songs_screens.dart';

class Songs extends StatefulWidget {
  final Function func;
  const Songs({super.key, required this.func});

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
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
                      title: "Songs",
                    ),
                  ));
            },
            child: Text(
              "Songs",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
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
