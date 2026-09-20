import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../database/app_database.dart';
import '../../data/models/learning_models.dart' as models;
import '../../data/repositories/learning_repository.dart';
import '../../data/repositories/learning_session_repository.dart';
import '../../data/seed/learning_seed_service.dart';
import '../../domain/services/local_learning_service.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
});

final learningRepositoryProvider = Provider<LearningRepository>((ref) {
  return LearningRepository(ref.watch(appDatabaseProvider));
});

final learningSeedServiceProvider = Provider<LearningSeedService>((ref) {
  return const LearningSeedService();
});

final localLearningServiceProvider = Provider<LocalLearningService>((ref) {
  return LocalLearningService(
    database: ref.watch(appDatabaseProvider),
    seedService: ref.watch(learningSeedServiceProvider),
  );
});

final learningInitializedProvider = FutureProvider<void>((ref) {
  return ref.watch(localLearningServiceProvider).initialize();
});

final subjectsProvider = FutureProvider<List<models.Subject>>((ref) async {
  await ref.watch(learningInitializedProvider.future);
  return ref.watch(learningRepositoryProvider).getSubjects();
});

final chaptersProvider =
    FutureProvider.family<List<models.Chapter>, int>((ref, subjectId) async {
  await ref.watch(learningInitializedProvider.future);
  return ref.watch(learningRepositoryProvider).getChapters(subjectId);
});

final learningUnitsProvider =
    FutureProvider.family<List<models.LearningUnit>, int>(
        (ref, chapterId) async {
  await ref.watch(learningInitializedProvider.future);
  return ref.watch(learningRepositoryProvider).getLearningUnits(chapterId);
});

final contentBlocksProvider =
    FutureProvider.family<List<models.ContentBlock>, int>(
        (ref, learningUnitId) async {
  await ref.watch(learningInitializedProvider.future);
  return ref.watch(learningRepositoryProvider).getContentBlocks(learningUnitId);
});

final knowledgeChecksProvider =
    FutureProvider.family<List<models.KnowledgeCheck>, int>(
        (ref, learningUnitId) async {
  await ref.watch(learningInitializedProvider.future);
  return ref
      .watch(learningRepositoryProvider)
      .getKnowledgeChecks(learningUnitId);
});

final learningSessionRepositoryProvider =
    Provider<LearningSessionRepository>((ref) {
  return LearningSessionRepository(ref.watch(appDatabaseProvider));
});

final learningSessionProvider =
    FutureProvider.family<models.LearningSession?, int>(
        (ref, learningUnitId) async {
  await ref.watch(learningInitializedProvider.future);
  return ref
      .watch(learningSessionRepositoryProvider)
      .getSession(learningUnitId);
});

final unitPersonalizationProvider =
    FutureProvider.family<models.UnitPersonalization, int>((ref, unitId) async {
  await ref.watch(learningInitializedProvider.future);
  return ref
      .watch(learningSessionRepositoryProvider)
      .getPersonalization(unitId);
});

final knowledgeCheckAttemptProvider =
    FutureProvider.family<models.KnowledgeCheckAttempt?, int>(
        (ref, checkId) async {
  await ref.watch(learningInitializedProvider.future);
  return ref
      .watch(learningSessionRepositoryProvider)
      .getKnowledgeCheckAttempt(checkId);
});

final learningUnitsForChapterProvider =
    FutureProvider.family<List<models.LearningUnit>, int>(
  (ref, chapterId) async {
    return ref.watch(learningUnitsProvider(chapterId).future);
  },
);

final latestLearningSessionProvider = FutureProvider<models.LearningSession?>(
  (ref) async {
    await ref.watch(learningInitializedProvider.future);

    final units =
        await ref.watch(learningRepositoryProvider).getAllLearningUnits();
    if (units.isEmpty) return null;

    final sessions = await ref
        .watch(learningSessionRepositoryProvider)
        .getSessionsForUnitIds(units.map((unit) => unit.id).toList());

    final active = sessions
        // A learner may leave a short unit before scrolling far enough to
        // register progress. Any saved position or study time is still a
        // meaningful resumable session.
        .where(
          (session) =>
              !session.completed &&
              (session.progress > 0 ||
                  session.totalStudySeconds > 0 ||
                  session.scrollPosition > 0),
        )
        .toList()
      ..sort(
        (a, b) => (b.lastActivityAt ?? DateTime.fromMillisecondsSinceEpoch(0))
            .compareTo(
          a.lastActivityAt ?? DateTime.fromMillisecondsSinceEpoch(0),
        ),
      );

    return active.isEmpty ? null : active.first;
  },
);

class LearningProgressSummary {
  const LearningProgressSummary({
    required this.totalUnits,
    required this.completedUnits,
    required this.totalStudySeconds,
  });

  final int totalUnits;
  final int completedUnits;
  final int totalStudySeconds;
  double get completion => totalUnits == 0 ? 0 : completedUnits / totalUnits;
}

/// Compact dashboard data, calculated off the widget tree from persisted
/// sessions so the home screen never has to build a list of every unit.
final learningProgressSummaryProvider =
    FutureProvider<LearningProgressSummary>((ref) async {
  await ref.watch(learningInitializedProvider.future);
  final units =
      await ref.watch(learningRepositoryProvider).getAllLearningUnits();
  final sessions = await ref
      .watch(learningSessionRepositoryProvider)
      .getSessionsForUnitIds(units.map((unit) => unit.id).toList());
  return LearningProgressSummary(
    totalUnits: units.length,
    completedUnits: sessions.where((session) => session.completed).length,
    totalStudySeconds:
        sessions.fold(0, (sum, session) => sum + session.totalStudySeconds),
  );
});

final learningUnitByIdProvider =
    FutureProvider.family<models.LearningUnit?, int>(
  (ref, unitId) async {
    await ref.watch(learningInitializedProvider.future);
    return ref.watch(learningRepositoryProvider).getLearningUnit(unitId);
  },
);
