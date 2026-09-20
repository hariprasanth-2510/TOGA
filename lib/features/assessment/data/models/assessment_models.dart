import 'dart:math';

enum AssessmentStatus { notStarted, inProgress, submitted, evaluated }

extension AssessmentStatusStorage on AssessmentStatus {
  String get storageValue => name;

  static AssessmentStatus fromStorage(String value) =>
      AssessmentStatus.values.firstWhere(
        (status) => status.name == value,
        orElse: () => AssessmentStatus.notStarted,
      );
}

class AssessmentConfig {
  const AssessmentConfig({
    this.questionCount = 20,
    this.duration = const Duration(minutes: 20),
    this.passMark = 0.70,
    this.allowReview = true,
    this.randomizeQuestions = true,
    this.randomizeOptions = true,
    this.showAnswersAfterSubmission = true,
  });

  final int questionCount;
  final Duration duration;
  final double passMark;
  final bool allowReview;
  final bool randomizeQuestions;
  final bool randomizeOptions;
  final bool showAnswersAfterSubmission;
}

class AssessmentQuestion {
  const AssessmentQuestion({
    required this.id,
    required this.topic,
    required this.subtopic,
    required this.difficulty,
    required this.text,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
    this.marks = 1,
    required this.learningUnitTitle,
  });

  final String id;
  final String topic;
  final String subtopic;
  final String difficulty;
  final String text;
  final List<String> options;
  final int correctOptionIndex;
  final String explanation;
  final int marks;
  final String learningUnitTitle;

  AssessmentQuestion shuffled(Random random) {
    final indexed = options.indexed.toList()..shuffle(random);
    return AssessmentQuestion(
      id: id,
      topic: topic,
      subtopic: subtopic,
      difficulty: difficulty,
      text: text,
      options: indexed.map((item) => item.$2).toList(),
      correctOptionIndex:
          indexed.indexWhere((item) => item.$1 == correctOptionIndex),
      explanation: explanation,
      marks: marks,
      learningUnitTitle: learningUnitTitle,
    );
  }

  AssessmentQuestion withOptionOrder(List<int> order) => AssessmentQuestion(
        id: id,
        topic: topic,
        subtopic: subtopic,
        difficulty: difficulty,
        text: text,
        options: order.map((index) => options[index]).toList(),
        correctOptionIndex: order.indexOf(correctOptionIndex),
        explanation: explanation,
        marks: marks,
        learningUnitTitle: learningUnitTitle,
      );
}

class AssessmentAttempt {
  const AssessmentAttempt({
    required this.id,
    required this.startedAt,
    required this.deadlineAt,
    required this.status,
    required this.currentQuestionIndex,
    required this.questionIds,
    required this.optionOrderByQuestionId,
    required this.flaggedQuestionIds,
    required this.answers,
    this.submittedAt,
  });

  final String id;
  final DateTime startedAt;
  final DateTime deadlineAt;
  final DateTime? submittedAt;
  final AssessmentStatus status;
  final int currentQuestionIndex;
  final List<String> questionIds;
  final Map<String, List<int>> optionOrderByQuestionId;
  final Set<String> flaggedQuestionIds;
  final Map<String, int?> answers;

  bool get isEditable => status == AssessmentStatus.inProgress;
  Duration remainingAt(DateTime now) =>
      deadlineAt.isAfter(now) ? deadlineAt.difference(now) : Duration.zero;
}

class QuestionResult {
  const QuestionResult({
    required this.question,
    required this.selectedOptionIndex,
  });

  final AssessmentQuestion question;
  final int? selectedOptionIndex;
  bool get isCorrect => selectedOptionIndex == question.correctOptionIndex;
}

class TopicAccuracy {
  const TopicAccuracy(
      {required this.topic, required this.correct, required this.total});
  final String topic;
  final int correct;
  final int total;
  double get percentage => total == 0 ? 0 : correct / total;
}

class AssessmentResult {
  const AssessmentResult({
    required this.attempt,
    required this.questions,
    required this.config,
  });

  final AssessmentAttempt attempt;
  final List<QuestionResult> questions;
  final AssessmentConfig config;

  int get correctCount => questions.where((item) => item.isCorrect).length;
  int get incorrectCount => questions
      .where((item) => item.selectedOptionIndex != null && !item.isCorrect)
      .length;
  int get unansweredCount =>
      questions.where((item) => item.selectedOptionIndex == null).length;
  int get rawScore => questions.where((item) => item.isCorrect).fold(
        0,
        (score, item) => score + item.question.marks,
      );
  int get totalMarks =>
      questions.fold(0, (sum, item) => sum + item.question.marks);
  double get percentage => totalMarks == 0 ? 0 : rawScore / totalMarks;
  bool get passed => percentage >= config.passMark;
  Duration get timeTaken =>
      (attempt.submittedAt ?? DateTime.now()).difference(attempt.startedAt);

  List<TopicAccuracy> get topicAccuracy {
    final values = <String, List<QuestionResult>>{};
    for (final item in questions) {
      values.putIfAbsent(item.question.topic, () => []).add(item);
    }
    return values.entries
        .map((entry) => TopicAccuracy(
              topic: entry.key,
              correct: entry.value.where((item) => item.isCorrect).length,
              total: entry.value.length,
            ))
        .toList()
      ..sort((a, b) => a.percentage.compareTo(b.percentage));
  }

  TopicAccuracy? get weakestTopic =>
      topicAccuracy.isEmpty ? null : topicAccuracy.first;
}
