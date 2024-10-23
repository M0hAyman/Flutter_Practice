import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.txt, this.fontSize, this.color, this.bold, {super.key});

  final String txt;
  final double fontSize;
  final Color color;
  final bool bold;
  @override
  Widget build(context) {
    return Text(txt,
        style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        )
        //fontWeight: FontWeight.bold,
        );
  }
}
