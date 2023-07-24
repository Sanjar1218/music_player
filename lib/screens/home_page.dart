import 'package:flutter/material.dart';

import '../widgets/list_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListCards(title: 'Your Playlists', imgPath: 'assets/images/Covers.png', onTap: () {
        Navigator.pushNamed(context, '/playlist');
      },),
    );
  }
}
