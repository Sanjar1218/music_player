import 'package:flutter/material.dart';

import './style/main_style.dart';

import './screens/main_screen.dart';
import './screens/playlist.dart';
import './screens/playing.dart';

void main() {
  runApp(const MainRoute());
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
        '/': (context) => const MainPage(),
        '/playlist': (context) => const PlaylistPage(),
        '/playing': (context) => const PlayingPage(),
      },
    );
  }
}
