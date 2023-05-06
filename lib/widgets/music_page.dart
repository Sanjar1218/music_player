import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/main_model.dart';

class Musicpage extends StatefulWidget {
  final Music music;
  const Musicpage({super.key, required this.music});

  @override
  State<Musicpage> createState() => _MusicpageState();
}

class _MusicpageState extends State<Musicpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  Image.asset("images/" + widget.music.music_author + ".png"),
            ),
          ),
          Column(
            children: [
              Text(
                widget.music.music_title,
                style: TextStyle(fontSize: 40),
              ),
              Text(
                widget.music.music_author,
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ],
          ),
          Container(
            height: 100,
            child: Row(
              children: [],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.pause)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
