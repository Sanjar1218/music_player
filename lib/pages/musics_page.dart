import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/blocs/music_bloc/music_bloc.dart';
import 'package:music_player/blocs/music_bloc/music_state.dart';
import 'package:music_player/core/functions/get_music_art.dart';
import 'package:music_player/pages/playing_page.dart';

class MusicsPage extends StatelessWidget {
  const MusicsPage({super.key});

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
                          return PlayingPage(music: state.musics[index]);
                        },
                      ),
                    );
                  },
                  title: Text(state.musics[index].albumName ?? "Unknown"),
                  subtitle: Text(state.musics[index].trackName ?? "Unknown"),
                  trailing: GetMusicArt(albumArt: state.musics[index].albumArt),
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
        child: Icon(Icons.music_note),
      ),
    );
  }
}
