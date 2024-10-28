import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/styled_text.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummartData() {
    final List<Map<String, Object>> summaryData = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summaryData.add(
        {
          'question_index': '${i + 1}',
          'question': questions[i].question,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summaryData;
  }

  @override
  Widget build(context) {
    final summaryData = getSummartData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      // a new way to fill the width instead of Center widget
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText(
                'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
                20,
                Colors.white,
                false,
                true),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(Icons.autorenew_rounded, color: Colors.white),
              onPressed: () {},
              label: const StyledText(
                'Restart Quiz!',
                15,
                Colors.white,
                false,
                false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
