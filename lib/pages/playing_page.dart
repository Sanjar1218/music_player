import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/blocs/playing_bloc/playing_bloc.dart';
import 'package:music_player/core/colors/text_colors.dart';
import 'package:music_player/core/functions/get_music_art.dart';
import 'package:music_player/models/music_model.dart';
import 'package:music_player/pages/widgets/music_tools.dart';

class PlayingPage extends StatefulWidget {
  final MusicModel music;
  const PlayingPage({
    super.key,
    required this.music,
  });

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {
  @override
  void initState() {
    context.read<PlayingBloc>().getFile(widget.music);
    super.initState();
  }

  @override
  void dispose() {
    context.read<PlayingBloc>().player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AudioPlayer state = context.read<PlayingBloc>().player;
    Duration dur = state.duration ?? const Duration(seconds: 1);
    Duration pos = state.position;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing'),
      ),
      body: Center(
        child: Column(
          children: [
            musicImage(context),
            const SizedBox(height: 16),
            MusicTools(context: context),
            const SizedBox(height: 16),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      Text(
                        '${pos.inMinutes}:${pos.inSeconds.remainder(60)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: TextColors.secondary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${dur.inMinutes}:${dur.inSeconds.remainder(60)}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: TextColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Slider(
                  value: pos.inSeconds.toDouble(),
                  min: 0,
                  max: dur.inSeconds.toDouble(),
                  onChanged: (value) {
                    context.read<PlayingBloc>().seek(
                          Duration(
                            seconds: value.toInt(),
                          ),
                        );
                  },
                  secondaryActiveColor: Colors.black,
                  activeColor: Colors.black,
                  thumbColor: Colors.black,
                ),
              ],
            ),
            playOrPause(context),
          ],
        ),
      ),
    );
  }

  Column musicImage(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetMusicArt(
            albumArt: widget.music.albumArt,
            width: MediaQuery.of(context).size.width * 0.8,
            height: 400,
          ),
        ),
        Text(
          widget.music.albumName ?? 'Unknown',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.music.trackName ?? 'Unknown',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: TextColors.secondary,
          ),
        ),
      ],
    );
  }

  Row playOrPause(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_previous,
            size: 70,
          ),
        ),
        IconButton(
          onPressed: () {
            if (context.read<PlayingBloc>().player.playing) {
              context.read<PlayingBloc>().pause();
              setState(() {});
            } else {
              context.read<PlayingBloc>().play();
              setState(() {});
            }
          },
          icon: Icon(
            context.read<PlayingBloc>().player.playing ? Icons.pause : Icons.play_arrow,
            size: 70,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next,
            size: 70,
          ),
        ),
      ],
    );
  }
}
