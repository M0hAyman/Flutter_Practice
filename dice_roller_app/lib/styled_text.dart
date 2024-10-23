import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.txt, {super.key});

  final String txt;

  @override
  Widget build(context) {
    return Text(txt,
        style: const TextStyle(
          fontSize: 28,
          color: Colors.white,
        )
        //fontWeight: FontWeight.bold,
        );
  }
}
