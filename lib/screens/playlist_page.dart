import 'package:flutter/material.dart';
import 'package:music_player/models/music_model.dart';
import 'package:provider/provider.dart';

import '../widgets/list_card.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    MusicModel s = Provider.of<MusicModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ]),
      body: ListCards(
        title: '${s.name} ${s.id}',
        imgPath: 'assets/images/Shortwave.png',
        onTap: () {
          Navigator.pushNamed(context, '/playing');
        },
      ),
    );
  }
}
