import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/blocs/playing_bloc/playing_bloc.dart';
import 'package:music_player/core/colors/text_colors.dart';
import 'package:music_player/core/functions/get_music_art.dart';
import 'package:music_player/models/music_model.dart';

class MusicImage extends StatelessWidget {
  const MusicImage({
    super.key,
    required this.music,
  });

  final List<MusicModel> music;

  @override
  Widget build(BuildContext context) {
    int index = context.watch<PlayingBloc>().player.currentIndex ?? 0;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetMusicArt(
            albumArt: music[index].albumArt,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 300,
          ),
        ),
        Text(
          music[index].albumName ?? 'Unknown',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          music[index].trackName ?? 'Unknown',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: TextColors.secondary,
          ),
        ),
      ],
    );
  }
}
