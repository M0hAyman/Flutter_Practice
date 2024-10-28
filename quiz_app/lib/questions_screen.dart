import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/styled_text.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function()? backToStart;
  final void Function(String answer) onSelectAnswer;
  const QuestionsScreen({
    super.key,
    this.backToStart,
    required this.onSelectAnswer,
  });

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  void initState() {
    print('questions init');
    // TODO: implement initState
    super.initState();
  }

  int currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      print('Q index: ${currentQuestionIndex + 1} out of ${questions.length}');
      //currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
      currentQuestionIndex++;
      //print('questionIndex: $currentQuestionIndex');
    });
  }

  @override
  Widget build(context) {
    print('questions build');

    // final numbers = [1, 2, 3];
    // final doubled = numbers.map((num2) {
    //   return num2 * 2;
    // });
    // print(doubled);
    // print(numbers);
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      // a new way to fill the width instead of Center widget
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StyledText(
              currentQuestion.question,
              20,
              const Color.fromARGB(255, 201, 140, 240),
              false,
              true,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('questions dispose');
    // TODO: implement dispose
    super.dispose();
  }
}
