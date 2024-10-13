import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/bloc/music_bloc.dart';
import 'package:music_player/di.dart';
import 'package:music_player/pages/musics_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MusicCubit>(
      create: (context) => locator(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MusicsPage(),
    );
  }
}
