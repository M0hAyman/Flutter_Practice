class QuizQuestion {
  final String question;
  final List<String> answers;
  //final int answerIndex;

  const QuizQuestion(
    this.question,
    this.answers,
    //this.answerIndex,
  );

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle(); //change the list in place

    //Note when final you can not do this:
    //shuffledList = ['Hello'];
    return shuffledList;
  }
}
