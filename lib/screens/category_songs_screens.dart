import 'package:flutter/material.dart';
import 'package:music_player/widgets/music_item.dart';

import '../models/main_model.dart';

class CategorySongsScreen extends StatefulWidget {
  final List<Music> list;
  final String title;
  const CategorySongsScreen({super.key, required this.list,required this.title});

  @override
  State<CategorySongsScreen> createState() => _CategorySongsScreenState();
}

class _CategorySongsScreenState extends State<CategorySongsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Wrap(
          children: widget.list.map((e) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: MusicItem(music: e, func: () {}),
        );
      }).toList()),
    );
  }
}
