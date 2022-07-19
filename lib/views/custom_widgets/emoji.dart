import 'package:flutter/material.dart';

class Emoji extends StatelessWidget {
  const Emoji({Key? key, required this.emoji}) : super(key: key);

  final String emoji;

  double getFontSize() {
    if (emoji == '✅') return 40;
    return 50;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 70,
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: getFontSize()),
        ),
      ),
    );
  }
}
