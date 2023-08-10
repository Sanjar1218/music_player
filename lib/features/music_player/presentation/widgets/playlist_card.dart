import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class PlaylistCard extends StatefulWidget {
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
  State<PlaylistCard> createState() => _PlaylistCardState();
}

class _PlaylistCardState extends State<PlaylistCard> {
  bool isLongPress = false;

  void onLongPress() {
    setState(() {
      isLongPress = !isLongPress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onLongPress: onLongPress,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 3, offset: Offset(0, 10))]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: widget.imgPath ?? Image.asset('assets/images/Shortwave.png'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 150,
                child: TextScroll(widget.title, style: const TextStyle(color: Color(0xFF081027), fontSize: 16, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 3, offset: Offset(0, 10))],
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
