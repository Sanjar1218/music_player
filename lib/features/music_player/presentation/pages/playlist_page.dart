import 'package:flutter/material.dart';
import 'package:music_player/features/music_player/presentation/pages/playing_page.dart';
import 'package:music_player/features/music_player/presentation/widgets/playlist_card.dart';

import '../widgets/list_card.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<PlaylistCard> children = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListCards(
        title: 'asdf',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const PlayingPage(audios: []);
              },
            ),
          );
        },
        children: children,
      ),
    );
  }
}
