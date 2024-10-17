import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/blocs/music_bloc/music_bloc.dart';
import 'package:music_player/blocs/music_bloc/music_state.dart';
import 'package:music_player/blocs/remote_bloc/remote_bloc.dart';
import 'package:music_player/blocs/remote_bloc/remote_state.dart';
import 'package:music_player/core/functions/get_music_art.dart';
import 'package:music_player/models/music_model.dart';
import 'package:music_player/pages/playing_page.dart';

class MusicsPage extends StatefulWidget {
  const MusicsPage({super.key});

  @override
  State<MusicsPage> createState() => _MusicsPageState();
}

class _MusicsPageState extends State<MusicsPage> {
  @override
  void initState() {
    context.read<MusicCubit>().loadMusic();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Musics"),
      ),
      body: BlocBuilder<MusicCubit, MusicState>(
        builder: (context, state) {
          if (state is Musicloaded) {
            return ListView.builder(
              itemCount: state.musics.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PlayingPage(music: state.musics, index: index);
                        },
                      ),
                    );
                  },
                  title: Text(state.musics[index].albumName ?? "Unknown"),
                  subtitle: Text(state.musics[index].trackName ?? "Unknown"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomDownloadButton(music: state.musics[index]),
                      GetMusicArt(albumArt: state.musics[index].albumArt),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("Musics page"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MusicCubit>().getMusics();
        },
        child: const Icon(Icons.music_note),
      ),
    );
  }
}

class CustomDownloadButton extends StatefulWidget {
  final MusicModel music;
  const CustomDownloadButton({
    super.key, required this.music,
  });

  @override
  State<CustomDownloadButton> createState() => _CustomDownloadButtonState();
}

class _CustomDownloadButtonState extends State<CustomDownloadButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteBloc, RemoteState>(
      builder: (context, state) {
        if (state is RemoteLoading) {
          return const CircularProgressIndicator();
        }
        if (state is RemoteLoaded) {
          return IconButton(
            onPressed: () {},
            icon: const Icon(Icons.download),
          );
        }
        return IconButton(
          onPressed: () {
            print("inside upload");
            context.read<RemoteBloc>().uploadRemote(widget.music);
          },
          icon: const Icon(Icons.upload),
        );
      },
    );
  }
}
