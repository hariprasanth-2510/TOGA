import 'package:flutter_test/flutter_test.dart';
import 'package:toga/features/assessment/data/models/assessment_models.dart';

AssessmentQuestion _question({
  required String id,
  required String topic,
  int correct = 0,
}) =>
    AssessmentQuestion(
      id: id,
      topic: topic,
      subtopic: topic,
      difficulty: 'Easy',
      text: 'Question $id',
      options: const ['A', 'B', 'C', 'D'],
      correctOptionIndex: correct,
      explanation: 'Explanation',
      learningUnitTitle: topic,
    );

AssessmentResult _result(Map<String, int?> answers) {
  final now = DateTime(2026, 1, 1, 12);
  final questions = [
    _question(id: '1', topic: 'VOR'),
    _question(id: '2', topic: 'DME', correct: 1)
  ];
  return AssessmentResult(
    config: const AssessmentConfig(),
    attempt: AssessmentAttempt(
      id: 'attempt',
      startedAt: now,
      deadlineAt: now.add(const Duration(minutes: 20)),
      submittedAt: now.add(const Duration(minutes: 12)),
      status: AssessmentStatus.submitted,
      currentQuestionIndex: 0,
      questionIds: const ['1', '2'],
      optionOrderByQuestionId: const {
        '1': [0, 1, 2, 3],
        '2': [0, 1, 2, 3]
      },
      flaggedQuestionIds: const {},
      answers: answers,
    ),
    questions: questions
        .map((q) =>
            QuestionResult(question: q, selectedOptionIndex: answers[q.id]))
        .toList(),
  );
}

void main() {
  test('scores correct answers and weighted percentage', () {
    final result = _result({'1': 0, '2': 1});
    expect(result.correctCount, 2);
    expect(result.percentage, 1);
    expect(result.passed, isTrue);
  });

  test('separates incorrect and unanswered answers', () {
    final result = _result({'1': 3});
    expect(result.correctCount, 0);
    expect(result.incorrectCount, 1);
    expect(result.unansweredCount, 1);
  });

  test('calculates topic mastery independently', () {
    final result = _result({'1': 0, '2': 3});
    final accuracy = {
      for (final item in result.topicAccuracy) item.topic: item.percentage
    };
    expect(accuracy, {'VOR': 1.0, 'DME': 0.0});
    expect(result.weakestTopic!.topic, 'DME');
  });

  test('restores remaining time from a persisted deadline', () {
    final now = DateTime(2026, 1, 1, 12);
    final attempt = AssessmentAttempt(
      id: 'attempt',
      startedAt: now,
      deadlineAt: now.add(const Duration(minutes: 20)),
      status: AssessmentStatus.inProgress,
      currentQuestionIndex: 14,
      questionIds: const ['1'],
      optionOrderByQuestionId: const {
        '1': [0, 1, 2, 3]
      },
      flaggedQuestionIds: const {},
      answers: const {},
    );
    expect(attempt.remainingAt(now.add(const Duration(minutes: 7))),
        const Duration(minutes: 13));
    expect(attempt.remainingAt(now.add(const Duration(minutes: 21))),
        Duration.zero);
  });

  test('maps shuffled option selection back to the correct answer', () {
    final source = _question(id: '1', topic: 'VOR', correct: 2);
    final displayed = source.withOptionOrder(const [2, 0, 1, 3]);
    expect(displayed.correctOptionIndex, 0);
    expect(
        QuestionResult(question: displayed, selectedOptionIndex: 0).isCorrect,
        isTrue);
  });

  test('aggregates persisted assessment results into learner analytics', () {
    final analytics = AssessmentAnalytics.fromResults([
      _result({'1': 0, '2': 1}),
      _result({'1': 0, '2': 3}),
    ]);

    expect(analytics.completedAttempts, 2);
    expect(analytics.averageScore, 0.75);
    expect(
      {for (final topic in analytics.topicMastery) topic.topic: topic.percentage},
      {'DME': 0.5, 'VOR': 1.0},
    );
  });
}
