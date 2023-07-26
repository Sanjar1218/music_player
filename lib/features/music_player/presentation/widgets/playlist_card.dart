import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  final String imgPath;
  final VoidCallback? onTap;

  const PlaylistCard({
    super.key,
    required this.imgPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  spreadRadius: 3,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(imgPath),
            ),
          ),
          const SizedBox(height: 8),
          const Text('Liked Songs',
              style: TextStyle(
                color: Color(0xFF081027),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              )),
        ],
      ),
    );
  }
}
