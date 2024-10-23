import 'package:flutter/material.dart';
import 'package:lab2/dice_roller.dart';
//import 'package:lab2/styled_text.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.colors, {super.key});

  GradientContainer.purple({super.key})
      : colors = [
          const Color.fromARGB(255, 0, 0, 255),
          const Color.fromARGB(255, 255, 0, 255),
        ];

  // final Color color1;
  // final Color color2;

  final List<Color> colors;
  //if we have variables, the class can not be const anymore :(

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment,
          end: endAlignment,
          colors: colors,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
