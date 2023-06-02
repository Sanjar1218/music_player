import 'package:flutter/material.dart';
import 'package:music_player/style/color.dart';

double rating = 0.0;
double newRating = 0.0;
Widget mainFunction(String str, String str1, String img,{double? size}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: TextButton(
      style: ElevatedButton.styleFrom(
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {},
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              img,
              width: size,
            ),
          ),
          Text(
            str,
            style: const TextStyle(fontSize: 20, color: black),
          ),
          Text(
            str1,
            style: const TextStyle(color: black),
          ),
        ],
      ),
    ),
  );
}
