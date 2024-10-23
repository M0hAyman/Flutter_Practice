import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';
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
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 200,
            ),
            const SizedBox(height: 20),
            const StyledText(
              'Learn Flutter the fun way',
              30,
              Colors.white,
              false,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                print('pressed!');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                //backgroundColor: Colors.deepPurple,
                //shape: RoundedRectangleBorder(
                //  borderRadius: BorderRadius.circular(20),
                //),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: StyledText(
                      'Start Quiz',
                      15,
                      Colors.white,
                      false,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                print('pressed!');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                //backgroundColor: Colors.deepPurple,
                //shape: RoundedRectangleBorder(
                //  borderRadius: BorderRadius.circular(20),
                //),
              ),
              icon: const Icon(Icons.play_arrow),
              label: const StyledText(
                'Start Quiz',
                15,
                Colors.white,
                false,
              ),
            ),
            const SizedBox(height: 20),
            const StyledText(
              '*Two buttons with different implementation!*',
              15,
              Colors.white,
              false,
            ),
            const StyledText(
              'IT IS INTENDED, DO YOU UNDERSTAND????',
              10,
              Colors.red,
              true,
            ),
          ],
        ),
      ),
    );
  }
}
