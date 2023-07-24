import 'package:flutter/material.dart';

import '../widgets/playlist_card.dart';

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
      body: const ListCards(),
    );
  }
}

class ListCards extends StatelessWidget {
  const ListCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              'Your Playlists',
              style: TextStyle(
                color: Color(0xFF081027),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.only(top: 7),
              crossAxisCount: 2,
              childAspectRatio: 12 / 14,
              children: const [
                PlaylistCard(),
                PlaylistCard(),
                PlaylistCard(),
                PlaylistCard(),
                PlaylistCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
