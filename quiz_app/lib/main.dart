import 'package:flutter/material.dart';
import 'package:quiz_app/gradient_container.dart';

void main() {
  const List<Color> colors = [
    // Color.fromARGB(255, 0, 243, 16),
    // Color.fromARGB(255, 74, 153, 0),
    Color.fromARGB(255, 60, 2, 101),
    Colors.deepPurple,
  ];
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
            colors), //Image.asset('assets/images/quiz-logo.png'),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
