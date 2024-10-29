import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/styled_text.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    this.onRestart,
    //Or required this.backToQuestionsScreen, --> if you want to remove the ? in the definition
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;
  final void Function()? onRestart;

  // List<Map<String, Object>> getSummaryData() {
  List<Map<String, Object>> get summaryData {
    //NewFinal: getters introduced --> still a method but refer to the function as variable
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
    //final summaryData = getSummaryData(); //NewFinal: you can get rid of that line after introducing the getters
    final numTotalQuestions = questions.length;
    // final numCorrectQuestions = summaryData.where((data) {
    //   return data['correct_answer'] == data['user_answer'];
    // }).length;
    final numCorrectQuestions = summaryData
        .where(
          (data) =>
              data['correct_answer'] ==
              data[
                  'user_answer'], //NewFinal: arrow function can replace the anonymous functions when the code is simple
        )
        .length;

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
              icon: const Icon(Icons.autorenew_rounded,
                  color: Colors
                      .white), //icon: const Icon(Icons.refresh, color: Colors.white),
              onPressed: onRestart,
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
