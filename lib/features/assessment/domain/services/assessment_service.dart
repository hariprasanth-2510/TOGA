import 'dart:math';

import '../../data/models/assessment_models.dart';
import '../../data/repositories/assessment_repository.dart';
import '../../data/seed/assessment_seed.dart';

class AssessmentService {
  AssessmentService(this._repository, {Random? random})
      : _random = random ?? Random();

  final AssessmentRepository _repository;
  final Random _random;
  final AssessmentConfig config = const AssessmentConfig();

  Future<AssessmentAttempt?> recoverActiveAttempt() async {
    final attempt = await _repository.getActiveAttempt();
    if (attempt != null && !attempt.deadlineAt.isAfter(DateTime.now())) {
      return submit(attempt.id);
    }
    return attempt;
  }

  Future<AssessmentAttempt> start() async {
    final existing = await recoverActiveAttempt();
    if (existing != null) return existing;

    var questions = List<AssessmentQuestion>.from(assessmentSeed);
    if (config.randomizeQuestions) questions.shuffle(_random);
    questions = questions.take(config.questionCount).toList();
    final optionOrderByQuestionId = <String, List<int>>{};
    for (final question in questions) {
      final order =
          List<int>.generate(question.options.length, (index) => index);
      if (config.randomizeOptions) order.shuffle(_random);
      optionOrderByQuestionId[question.id] = order;
    }
    final now = DateTime.now();
    final attempt = AssessmentAttempt(
      id: 'assessment-${now.microsecondsSinceEpoch}',
      startedAt: now,
      deadlineAt: now.add(config.duration),
      status: AssessmentStatus.inProgress,
      currentQuestionIndex: 0,
      questionIds: questions.map((question) => question.id).toList(),
      optionOrderByQuestionId: optionOrderByQuestionId,
      flaggedQuestionIds: {},
      answers: const {},
    );
    await _repository.createAttempt(attempt);
    return attempt;
  }

  List<AssessmentQuestion> questionsFor(AssessmentAttempt attempt) {
    final byId = {for (final question in assessmentSeed) question.id: question};
    return attempt.questionIds
        .map((id) {
          final question = byId[id];
          final order = attempt.optionOrderByQuestionId[id];
          return question == null || order == null
              ? question
              : question.withOptionOrder(order);
        })
        .whereType<AssessmentQuestion>()
        .toList();
  }

  Future<void> answer(
      AssessmentAttempt attempt, String questionId, int optionIndex) {
    _ensureEditable(attempt);
    return _repository.saveAnswer(attempt.id, questionId, optionIndex);
  }

  Future<void> selectQuestion(AssessmentAttempt attempt, int index) {
    _ensureEditable(attempt);
    if (index < 0 || index >= attempt.questionIds.length) {
      throw ArgumentError.value(index, 'index', 'Question is out of range');
    }
    return _repository.saveCurrentQuestion(attempt.id, index);
  }

  Future<void> toggleFlag(AssessmentAttempt attempt, String questionId) {
    _ensureEditable(attempt);
    final flags = {...attempt.flaggedQuestionIds};
    flags.contains(questionId)
        ? flags.remove(questionId)
        : flags.add(questionId);
    return _repository.saveFlags(attempt.id, flags);
  }

  Future<AssessmentAttempt> submit(String attemptId) async {
    final attempt = await _repository.getAttempt(attemptId);
    if (attempt == null) throw StateError('Assessment attempt was not found.');
    if (attempt.status == AssessmentStatus.submitted ||
        attempt.status == AssessmentStatus.evaluated) {
      return attempt;
    }
    if (attempt.status != AssessmentStatus.inProgress) {
      throw StateError(
          'This assessment cannot be submitted from its current state.');
    }
    await _repository.submit(attempt.id, DateTime.now());
    return (await _repository.getAttempt(attempt.id))!;
  }

  Future<AssessmentResult> resultFor(String attemptId) async {
    final attempt = await _repository.getAttempt(attemptId);
    if (attempt == null) throw StateError('Assessment attempt was not found.');
    if (attempt.status == AssessmentStatus.inProgress) {
      throw StateError('Submit the assessment before viewing results.');
    }
    final questions = questionsFor(attempt);
    return AssessmentResult(
      attempt: attempt,
      config: config,
      questions: questions
          .map((question) => QuestionResult(
                question: question,
                selectedOptionIndex: attempt.answers[question.id],
              ))
          .toList(),
    );
  }

  Future<AssessmentAnalytics> analytics() async {
    final attempts = await _repository.getSubmittedAttempts();
    final results = <AssessmentResult>[];
    for (final attempt in attempts) {
      final questions = questionsFor(attempt);
      results.add(AssessmentResult(
        attempt: attempt,
        config: config,
        questions: questions
            .map((question) => QuestionResult(
                  question: question,
                  selectedOptionIndex: attempt.answers[question.id],
                ))
            .toList(),
      ));
    }
    return AssessmentAnalytics.fromResults(results);
  }

  void _ensureEditable(AssessmentAttempt attempt) {
    if (!attempt.isEditable || !attempt.deadlineAt.isAfter(DateTime.now())) {
      throw StateError('This assessment is no longer editable.');
    }
  }
}
