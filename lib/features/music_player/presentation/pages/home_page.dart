import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/music_playlist_provider.dart';
import '../widgets/list_card.dart';
import '../widgets/playlist_card.dart';
import 'playlist_page.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<MusicPlaylistProvider>(context, listen: false).getPlaylist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicPlaylistProvider>(
      builder: (context, watch, child) {
          return Scaffold(
          backgroundColor: Colors.white,
          drawer: const SettingsPage(),
          appBar: AppBar(
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
          ),
          body: ListCards(
            title: 'Your Playlists',
            children: watch.playlist
                .map(
                  (e) => PlaylistCard(
                    title: e.title,
                    imgPath: Image.asset('assets/images/Shortwave.png'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PlaylistPage(model: e);
                          },
                        ),
                      );
                    },
                  ),
                )
                .toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              watch.addList();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
