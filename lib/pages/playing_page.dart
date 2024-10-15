import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/blocs/playing_bloc/playing_bloc.dart';
import 'package:music_player/blocs/playing_bloc/playing_state.dart';
import 'package:music_player/core/colors/text_colors.dart';
import 'package:music_player/core/functions/get_music_art.dart';
import 'package:music_player/models/music_model.dart';

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
    context.read<PlayingBloc>().player.durationStream.listen((event) {
      print(event);
    });
    super.initState();
  }

  @override
  void dispose() {
    context.read<PlayingBloc>().player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playing'),
      ),
      body: BlocBuilder<PlayingBloc, PlayingState>(
        builder: (context, state) {
          if (state is PlayingLoaded) {
            return Center(
              child: Column(
                children: [
                  musicImage(context),
                  const SizedBox(height: 16),
                  musicTools(),
                  Slider(
                    value: 0.5,
                    onChanged: (value) {},
                    secondaryActiveColor: Colors.black,
                    activeColor: Colors.black,
                    thumbColor: Colors.black,
                  ),
                  playOrPause(context),
                ],
              ),
            );
          }
          if (state is PlayingError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text('Playing page'),
          );
        },
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

  Padding musicTools() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.volume_mute,
              size: 40,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.loop,
                  size: 40,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shuffle,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
