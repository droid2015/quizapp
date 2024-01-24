class Category {
  String id;
  String name;

  Category({required this.id, required this.name});
}

class DifficultyLevel {
  String id;
  String name;

  DifficultyLevel({required this.id, required this.name});
}

class Question {
  String id;
  String text;
  Category category;
  DifficultyLevel difficulty;
  List<Answer> answers;

  Question({
    required this.id,
    required this.text,
    required this.category,
    required this.difficulty,
    required this.answers,
  });
}

class Answer {
  String id;
  String questionId;
  String text;
  bool isCorrect;

  Answer({required this.id, required this.questionId, required this.text, required this.isCorrect});
}