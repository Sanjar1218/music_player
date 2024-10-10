import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/music_player/presentation/pages/home_page.dart';
import 'features/music_player/presentation/pages/playing_page.dart';
import 'features/music_player/presentation/providers/music_player_provider.dart';
import 'features/music_player/presentation/providers/music_playlist_provider.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MusicPlaylistProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MusicPlayingProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'Music Player',
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
          // '/playlist': (context) => const PlaylistPage(),
          '/playing': (context) => const PlayingPage(),
        },
      ),
    );
  }
}
