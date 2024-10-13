import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/bloc/music_bloc.dart';
import 'package:music_player/bloc/music_state.dart';

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
                  title: Text(state.musics[index].albumName ?? "Unknown"),
                  subtitle: Text(state.musics[index].trackName ?? "Unknown"),
                  trailing: state.musics[index].albumArt != null
                      ? Image.memory(
                          state.musics[index].albumArt!,
                          width: 50,
                          height: 50,
                        )
                      : const Icon(Icons.music_note),
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
