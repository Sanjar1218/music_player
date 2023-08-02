import 'package:flutter/material.dart';

import 'playlist_card.dart';

class ListCards extends StatelessWidget {
  final String title;
  final List<PlaylistCard> children;
  final VoidCallback? onTap;

  const ListCards({
    super.key,
    required this.title,
    this.onTap,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(title, style: const TextStyle(color: Color(0xFF081027), fontSize: 24, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.only(top: 7),
              crossAxisCount: 2,
              childAspectRatio: 12 / 14,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
