import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Text((data['question_index']).toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['question'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            'Your Answer: ${data['user_answer'] ?? 'No answer provided'}'),
                        Text(
                            'Correct Answer: ${data['correct_answer'] ?? 'No answer provided'}'),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(), //Converts Iterable object to list object
        ),
      ),
    );
  }
}
