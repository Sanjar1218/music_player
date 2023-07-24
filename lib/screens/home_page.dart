import 'package:flutter/material.dart';
import 'package:music_player/models/music_model.dart';
import 'package:provider/provider.dart';

import '../widgets/list_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          MusicModel s = Provider.of<MusicModel>(context, listen: false);
          s.name = 'salom';
        }, icon: const Icon(Icons.search))],
      ),
      body: ListCards(title: 'Your Playlists', imgPath: 'assets/images/Covers.png', onTap: () {
        Navigator.pushNamed(context, '/playlist');
      },),
    );
  }
}
