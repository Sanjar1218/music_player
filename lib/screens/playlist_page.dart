import 'package:flutter/material.dart';

import '../widgets/list_card.dart';

class PlaylistPage extends StatelessWidget {
  const PlaylistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ]),
      body: ListCards(
        title: 'asdf',
        imgPath: 'assets/images/Shortwave.png',
        onTap: () {
          Navigator.pushNamed(context, '/playing');
        },
      ),
    );
  }
}
