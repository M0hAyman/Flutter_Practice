import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(
      this.txt, this.fontSize, this.color, this.bold, this.textAlignCenter,
      {super.key});

  final String txt;
  final double fontSize;
  final Color color;
  final bool bold;
  final bool textAlignCenter;
  @override
  Widget build(context) {
    return Text(
      txt,
      style: GoogleFonts.lato(
        fontSize: fontSize,
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
      textAlign: textAlignCenter ? TextAlign.center : TextAlign.start,
      //fontWeight: FontWeight.bold,
    );
  }
}
