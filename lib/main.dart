import 'package:flutter/material.dart';
import 'package:music_player/models/music_model.dart';
import 'package:music_player/screens/playing_page.dart';
import 'package:music_player/screens/playlist_page.dart';
import 'package:provider/provider.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MusicModel(id: 3, name: 'hello'),
      child: MaterialApp(
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
      ),
    );
  }
}
