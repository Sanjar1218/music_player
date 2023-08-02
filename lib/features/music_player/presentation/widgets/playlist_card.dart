import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  final String title;
  final Image? imgPath;
  final VoidCallback? onTap;

  const PlaylistCard({
    super.key,
    this.imgPath,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 3, offset: Offset(0, 10))]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imgPath ?? Image.asset('assets/images/Shortwave.png'),
            ),
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Color(0xFF081027), fontSize: 16, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
