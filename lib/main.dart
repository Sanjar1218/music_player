import 'package:flutter/material.dart';

import 'features/music_player/presentation/pages/home_page.dart';
import 'features/music_player/presentation/pages/playing_page.dart';
import 'features/music_player/presentation/pages/playlist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/playlist': (context) => const PlaylistPage(),
        '/playing': (context) => const PlayingPage(),
      },
    );
  }
}
