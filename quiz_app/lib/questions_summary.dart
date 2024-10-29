import 'package:flutter/material.dart';
import 'package:quiz_app/styled_text.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            data['correct_answer'] == data['user_answer']
                                ? const Color.fromARGB(255, 1, 112, 163)
                                : const Color.fromARGB(255, 166, 0, 141),
                        child: StyledText(
                          (data['question_index']).toString(),
                          15,
                          Colors.black,
                          true,
                          true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StyledText(
                            (data['question'] as String),
                            14,
                            Colors.white,
                            true,
                            false,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          StyledText(
                            '${data['user_answer'] ?? 'No answer provided'}',
                            13,
                            const Color.fromARGB(255, 166, 0, 141),
                            true,
                            false,
                          ),
                          StyledText(
                            '${data['correct_answer'] ?? 'No answer provided'}',
                            13,
                            const Color.fromARGB(255, 1, 112, 163),
                            true,
                            false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(), //Converts Iterable object to list object
        ),
      ),
    );
  }
}
