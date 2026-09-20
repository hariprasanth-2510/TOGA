import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../database/app_database.dart' as db;
import '../models/assessment_models.dart';

class AssessmentRepository {
  AssessmentRepository(this._database);
  final db.AppDatabase _database;

  Future<AssessmentAttempt?> getActiveAttempt() async {
    final row = await (_database.select(_database.assessmentAttempts)
          ..where(
              (table) => table.status.equals(AssessmentStatus.inProgress.name))
          ..orderBy([(table) => OrderingTerm.desc(table.startedAt)]))
        .getSingleOrNull();
    return row == null ? null : _mapAttempt(row);
  }

  Future<AssessmentAttempt?> getAttempt(String id) async {
    final row = await (_database.select(_database.assessmentAttempts)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _mapAttempt(row);
  }

  Future<void> createAttempt(AssessmentAttempt attempt) =>
      _database.into(_database.assessmentAttempts).insert(
            db.AssessmentAttemptsCompanion.insert(
              id: attempt.id,
              startedAt: attempt.startedAt,
              deadlineAt: attempt.deadlineAt,
              status: attempt.status.name,
              currentQuestionIndex: Value(attempt.currentQuestionIndex),
              questionOrderJson: jsonEncode(attempt.questionIds),
              optionOrderJson:
                  Value(jsonEncode(attempt.optionOrderByQuestionId)),
              flaggedQuestionIdsJson:
                  Value(jsonEncode(attempt.flaggedQuestionIds.toList())),
            ),
          );

  Future<void> saveCurrentQuestion(String id, int index) =>
      (_database.update(_database.assessmentAttempts)
            ..where((table) => table.id.equals(id)))
          .write(
        db.AssessmentAttemptsCompanion(currentQuestionIndex: Value(index)),
      );

  Future<void> saveFlags(String id, Set<String> flags) =>
      (_database.update(_database.assessmentAttempts)
            ..where((table) => table.id.equals(id)))
          .write(
        db.AssessmentAttemptsCompanion(
          flaggedQuestionIdsJson: Value(jsonEncode(flags.toList())),
        ),
      );

  Future<void> saveAnswer(
      String attemptId, String questionId, int index) async {
    final existing = await (_database.select(_database.assessmentAnswers)
          ..where(
            (table) =>
                table.attemptId.equals(attemptId) &
                table.questionId.equals(questionId),
          ))
        .getSingleOrNull();
    if (existing == null) {
      await _database.into(_database.assessmentAnswers).insert(
            db.AssessmentAnswersCompanion.insert(
              attemptId: attemptId,
              questionId: questionId,
              selectedOptionIndex: Value(index),
            ),
          );
    } else {
      await (_database.update(_database.assessmentAnswers)
            ..where((table) => table.id.equals(existing.id)))
          .write(
        db.AssessmentAnswersCompanion(selectedOptionIndex: Value(index)),
      );
    }
  }

  Future<void> submit(String id, DateTime submittedAt) =>
      (_database.update(_database.assessmentAttempts)
            ..where((table) => table.id.equals(id)))
          .write(
        db.AssessmentAttemptsCompanion(
          status: Value(AssessmentStatus.submitted.name),
          submittedAt: Value(submittedAt),
        ),
      );

  Future<AssessmentAttempt> _mapAttempt(db.AssessmentAttempt row) async {
    final answers = await (_database.select(_database.assessmentAnswers)
          ..where((table) => table.attemptId.equals(row.id)))
        .get();
    return AssessmentAttempt(
      id: row.id,
      startedAt: row.startedAt,
      deadlineAt: row.deadlineAt,
      submittedAt: row.submittedAt,
      status: AssessmentStatusStorage.fromStorage(row.status),
      currentQuestionIndex: row.currentQuestionIndex,
      questionIds: (jsonDecode(row.questionOrderJson) as List).cast<String>(),
      optionOrderByQuestionId:
          (jsonDecode(row.optionOrderJson) as Map<String, dynamic>).map(
        (questionId, order) => MapEntry(
          questionId,
          (order as List).cast<num>().map((value) => value.toInt()).toList(),
        ),
      ),
      flaggedQuestionIds: (jsonDecode(row.flaggedQuestionIdsJson) as List)
          .cast<String>()
          .toSet(),
      answers: {
        for (final answer in answers)
          answer.questionId: answer.selectedOptionIndex,
      },
    );
  }
}
