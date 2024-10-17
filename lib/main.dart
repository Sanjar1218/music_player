import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/blocs/music_bloc/music_bloc.dart';
import 'package:music_player/blocs/playing_bloc/playing_bloc.dart';
import 'package:music_player/blocs/remote_bloc/remote_bloc.dart';
import 'package:music_player/di.dart';
import 'package:music_player/pages/musics_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
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

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MusicCubit>(
          create: (context) => locator(),
        ),
        BlocProvider<PlayingBloc>(
          create: (context) => locator(),
        ),
        BlocProvider<RemoteBloc>(
          create: (context) => locator(),
        ),
      ],
      child: const MyApp(),
    );
  }
}
