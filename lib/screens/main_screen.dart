import 'package:flutter/material.dart';

import '../functions/main_music.dart';
import 'constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: red,
      home: Scaffold(
          drawer: const Drawer(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: black),
            backgroundColor: white,
            elevation: 0.0,
            titleSpacing: 250,
            title: const Icon(
              Icons.search_rounded,
              color: black,
            ),
          ),
          body: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    recommended,
                    style: TextStyle(fontSize: 23),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    mainFunction(osman_music, osman, 'images/osman.png',
                        size: 160),
                    mainFunction(sami_music, sami, 'images/sami_yusuf.png',
                        size: 160),
                    mainFunction(
                        bunyodbek_music, bunyodbek, 'images/bunyodbek.png',
                        size: 160),
                    mainFunction(sardor_music, sardor, 'images/sardor.png',
                        size: 160),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    mainFunction(rauf_music, rauf_faik, 'images/rauf_faik.png',
                        size: 160),
                    mainFunction(yusuf_music, yusuf, 'images/yusuf.png',
                        size: 160),
                    mainFunction(ozodbek_music, ozodbek, 'images/ozodbek.png',
                        size: 160),
                    mainFunction(bahrom_music, bahrom, 'images/bahrom.png',
                        size: 160),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Slider(
                      autofocus: true,
                      activeColor: black,
                      value: rating,
                      max: 100,
                      divisions: 100,
                      label: rating.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('images/sardor.png', scale: 7),
                        Column(
                          children: const [
                            Text(
                              sardor,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              sardor_music,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.skip_previous_outlined,
                          size: 35
                        ),
                        Icon(
                          Icons.pause,
                          size: 35,
                        ),
                        Icon(
                          Icons.skip_next_outlined,
                          size: 35,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
