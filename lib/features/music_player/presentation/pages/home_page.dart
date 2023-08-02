import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:music_player/features/music_player/presentation/pages/playing_page.dart';

import '../../../../core/utils/get_files.dart';
import '../widgets/list_card.dart';
import '../widgets/playlist_card.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PlaylistCard> children = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SettingsPage(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListCards(
        title: 'Your Playlists',
        onTap: () {
          Navigator.pushNamed(context, '/playlist');
        },
        children: [
          PlaylistCard(
            title: 'Shortwave',
            imgPath: Image.asset('assets/images/Shortwave.png'),
            onTap: () {
              Navigator.pushNamed(context, '/playlist');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  void getFolders() {
    FilePicker.platform.getDirectoryPath().then((value) async {
      var files = await getFiles(value ?? '');
      print(files);
      setState(() {
        children = files
            .mapIndexed(
              (index, e) => PlaylistCard(
                title: e.metas.title ?? 'Unknown',
                imgPath: e.metas.extra?['image'],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return PlayingPage(audios: files, index: index);
                      },
                    ),
                  );
                },
              ),
            )
            .toList();
      });
    });
  }
}
