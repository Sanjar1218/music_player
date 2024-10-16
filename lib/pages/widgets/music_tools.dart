
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/blocs/playing_bloc/playing_bloc.dart';

class MusicTools extends StatefulWidget {
  const MusicTools({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  State<MusicTools> createState() => _MusicToolsState();
}

class _MusicToolsState extends State<MusicTools> {
  bool isMuted = false;
  bool isLooping = false;
  bool isShuffling = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.read<PlayingBloc>().setVolume(isMuted ? 1 : 0);
              setState(() {
                isMuted = !isMuted;
              });
            },
            icon: Icon(
              isMuted ? Icons.volume_off : Icons.volume_up,
              size: 40,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  if (isLooping) {
                    context.read<PlayingBloc>().setLoopMode(LoopMode.off);
                  } else {
                    context.read<PlayingBloc>().setLoopMode(LoopMode.one);
                  }
                  setState(() {
                    isLooping = !isLooping;
                  });
                },
                icon: Icon(
                  isLooping ? Icons.repeat : Icons.repeat_one,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<PlayingBloc>().setShuffleModeEnabled(!isShuffling);
                  setState(() {
                    isShuffling = !isShuffling;
                  });
                },
                icon: Icon(Icons.shuffle,
                  size: 40,
                  color: isShuffling ? Colors.black : Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
