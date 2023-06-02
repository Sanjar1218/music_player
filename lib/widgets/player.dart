import 'package:flutter/material.dart';
import 'package:music_player/models/main_model.dart';

class Player extends StatefulWidget {
  final Music music;
  const Player({super.key, required this.music});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        children: [
          Image.asset("images/${widget.music.music_author}.png"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.music.music_title,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.music.music_author,
                  style: const TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.pause)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios)),
            ],
          )
        ],
      ),
    );
  }
}
