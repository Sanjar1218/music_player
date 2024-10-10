import 'package:flutter/material.dart';
import 'package:music_player/features/music_player/data/models/music_model.dart';
import 'package:music_player/features/music_player/data/models/playlist_model.dart';
import 'package:provider/provider.dart';

import '../providers/music_playlist_provider.dart';
import '../widgets/list_card.dart';
import '../widgets/playlist_card.dart';
import 'playing_page.dart';

class PlaylistPage extends StatefulWidget {
  final PlaylistModel model;

  const PlaylistPage({
    super.key,
    required this.model,
  });

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  @override
  void initState() {
    Provider.of<MusicPlaylistProvider>(context, listen: false).getMusics(widget.model.path);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlaylistProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          ),
          body: ListCards(
            title: widget.model.title,
            children: provider.musics
                .map((e) => PlaylistCard(
                      title: e.title,
                      imgPath: e.metas.extra?['image'],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PlayingPage(audios: provider.musics);
                            },
                          ),
                        );
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
