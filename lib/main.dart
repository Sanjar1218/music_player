import 'package:flutter/material.dart';
import 'package:music_player/data/data.dart';
import 'package:music_player/models/main_model.dart';
import 'package:music_player/screens/my_playlist_screens.dart';

import 'package:music_player/screens/recommended_screens.dart';
import 'package:music_player/screens/songs.dart';
import 'package:music_player/widgets/drawer.dart';
import 'package:music_player/widgets/player.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}
class MainRoute extends StatelessWidget {
  const MainRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: '/playing',
      routes: {
        'mmm': (context) => const MainPage(),
        '/playlist': (context) => const PlaylistPage(),
        '/playing': (context) => const PlayingPage(),
      },
    );
  }
}
