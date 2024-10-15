import 'dart:typed_data';

import 'package:flutter/material.dart';

class GetMusicArt extends StatelessWidget {
  final Uint8List? albumArt;
  final double? width;
  final double? height;

  const GetMusicArt({
    required this.albumArt,
    double this.width = 50,
    double this.height = 50,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return albumArt != null
        ? Image.memory(
            albumArt!,
            width: width,
            height: height,
            fit: BoxFit.cover,
          )
        : Image.asset(
            'assets/images/music.png',
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
  }
}
