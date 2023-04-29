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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [IconButton(onPressed:(){}, icon: Icon(Icons.search))],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: HomePage(),
      drawer: Drawer(
        child: DrawerPage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Music ms = musicList[0];
  func(Music music) {
    setState(() {
      ms = music;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.77,
          child: ListView(
            children: [
              RecommendedScreen(func: func),
              MyPlaylistScreens(func: func),
              Songs(func: func),
            ],
          ),
        ),
        Player(
          music: ms,
        )
      ],
    );
  }
}
