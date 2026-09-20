import 'package:drift/drift.dart';

import '../../../../database/app_database.dart' as db;
import '../models/learning_models.dart';

class LearningSessionRepository {
  LearningSessionRepository(this._database);

  final db.AppDatabase _database;

  Future<LearningSession?> getSession(int learningUnitId) async {
    final row = await (_database.select(_database.learningSessions)
          ..where((table) => table.learningUnitId.equals(learningUnitId)))
        .getSingleOrNull();
    return row == null ? null : _map(row);
  }

  Future<List<LearningSession>> getSessionsForUnitIds(
    List<int> learningUnitIds,
  ) async {
    if (learningUnitIds.isEmpty) {
      return [];
    }

    final rows = await (_database.select(_database.learningSessions)
          ..where(
            (table) => table.learningUnitId.isIn(learningUnitIds),
          ))
        .get();

    return rows
        .map(
          (row) => LearningSession(
            id: row.id,
            subjectId: row.subjectId,
            chapterId: row.chapterId,
            learningUnitId: row.learningUnitId,
            scrollPosition: row.scrollPosition,
            completed: row.completed,
            progress: row.progress,
            sessionStartedAt: row.sessionStartedAt,
            totalStudySeconds: row.totalStudySeconds,
            lastActivityAt: row.lastActivityAt,
          ),
        )
        .toList();
  }

  Future<LearningSession> startOrResume({
    required int subjectId,
    required int chapterId,
    required int learningUnitId,
  }) async {
    final existing = await getSession(learningUnitId);
    if (existing != null) return existing;

    final now = DateTime.now();
    final id = await _database.into(_database.learningSessions).insert(
          db.LearningSessionsCompanion.insert(
            subjectId: subjectId,
            chapterId: chapterId,
            learningUnitId: learningUnitId,
            sessionStartedAt: Value(now),
            lastActivityAt: Value(now),
          ),
        );
    return (await _getById(id))!;
  }

  Future<void> updateSession({
    required int id,
    required double scrollPosition,
    required double progress,
    required bool completed,
    required int totalStudySeconds,
  }) async {
    await (_database.update(_database.learningSessions)
          ..where((table) => table.id.equals(id)))
        .write(
      db.LearningSessionsCompanion(
        scrollPosition: Value(scrollPosition),
        progress: Value(progress.clamp(0.0, 1.0)),
        completed: Value(completed),
        totalStudySeconds: Value(totalStudySeconds),
        lastActivityAt: Value(DateTime.now()),
      ),
    );
  }

  Future<LearningSession?> _getById(int id) async {
    final row = await (_database.select(_database.learningSessions)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : _map(row);
  }

  LearningSession _map(db.LearningSession row) => LearningSession(
        id: row.id,
        subjectId: row.subjectId,
        chapterId: row.chapterId,
        learningUnitId: row.learningUnitId,
        scrollPosition: row.scrollPosition,
        completed: row.completed,
        progress: row.progress,
        sessionStartedAt: row.sessionStartedAt,
        totalStudySeconds: row.totalStudySeconds,
        lastActivityAt: row.lastActivityAt,
      );
}
