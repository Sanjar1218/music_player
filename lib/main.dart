import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainRoute(),
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
