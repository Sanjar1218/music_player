import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:music_player/models/main_model.dart';
import 'package:music_player/widgets/music_page.dart';

class MusicItem extends StatefulWidget {
  final Function func;
  final Music music;
  const MusicItem({super.key, required this.music, required this.func});

  @override
  State<MusicItem> createState() => _MusicItemState();
}

class _MusicItemState extends State<MusicItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          widget.func(widget.music);
        },
        onDoubleTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Musicpage(
                  music: widget.music,
                ),
              ));
        },
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(offset: Offset(1, 5), blurRadius: 5)],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      "images/" + widget.music.music_author + ".png"),
                ),
              ),
            ),
            Text(
              widget.music.music_title,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              widget.music.music_author,
              style: TextStyle(color: Colors.grey, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
