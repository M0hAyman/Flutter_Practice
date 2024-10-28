import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),

          //Opacity is performance intensive, you should avoid that!
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 200,
          //   ),
          // ),
          const SizedBox(height: 20),
          const StyledText(
            'Learn Flutter the fun way',
            30,
            Colors.white,
            false,
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
                    false,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: startQuiz,
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
              false,
            ),
          ),
          const SizedBox(height: 20),
          const StyledText(
            '*Two buttons with different implementation!*',
            15,
            Colors.white,
            false,
            false,
          ),
          const StyledText(
            'IT IS INTENDED, DO YOU UNDERSTAND????',
            10,
            Colors.red,
            true,
            false,
          ),
        ],
      ),
    );
  }
}
