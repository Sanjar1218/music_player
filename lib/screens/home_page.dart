import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const [
          PlaylistCard(),
          PlaylistCard(),
          PlaylistCard(),
          PlaylistCard(),
          PlaylistCard(),
        ],
      ),
    );
  }
}

class PlaylistCard extends StatelessWidget {
  const PlaylistCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Image.asset('assets/images/Group 47.png'),
        const Text('Liked Songs'),
      ]),
    );
  }
}
