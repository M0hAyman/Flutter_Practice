import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/gradient_container.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

const List<Color> colors = [
  // Color.fromARGB(255, 0, 243, 16),
  // Color.fromARGB(255, 74, 153, 0),
  Color.fromARGB(255, 60, 2, 101),
  Colors.deepPurple,
];

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen; // `activeScreen` can be null initially

  //final List<String> selectedAnswers = [];
  //removed final because list will be reset
  List<String> _selectedAnswers = []; //NewFinal: private property
  String currScreen = 'start-screen';

  //@override
  // void initState() {
  //   print('quiz init');
  //   super.initState();
  //   activeScreen = StartScreen(switchToQuestionsScreen);
  // }

  void switchToQuestionsScreen() {
    setState(() {
      print('switching to questions screen');
      //activeScreen = QuestionsScreen(backToStart: backToStartScreen);
      currScreen = 'questions-screen';
    });
  }

  void backToStartScreen() {
    setState(() {
      //activeScreen = StartScreen(switchToQuestionsScreen);
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        currScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      currScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // final screenWidget = currScreen == 'start-screen'
    //     ? StartScreen(switchToQuestionsScreen)
    //     : const QuestionsScreen();

    //Alternative way using 'if'
    Widget screenWidget = StartScreen(switchToQuestionsScreen);

    if (currScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (currScreen == 'results-screen') {
      //We got rid of const ResultsScreen() because we need to pass the selectedAnswers which is a variable that dynamically changes
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    print('quiz build');
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors,
          //activeScreen,
          screenWidget,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  void dispose() {
    print('quiz dispose');
    // TODO: implement dispose
    super.dispose();
  }
}
