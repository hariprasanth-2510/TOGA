import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../database/app_database.dart' as db;
import '../../data/models/learning_models.dart';
import '../../data/repositories/learning_repository.dart';
import '../../data/seed/learning_seed_service.dart';
import '../../domain/services/local_learning_service.dart';

final appDatabaseProvider = Provider<db.AppDatabase>((ref) {
  final database = db.AppDatabase();

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

final subjectsProvider = FutureProvider<List<Subject>>((ref) async {
  await ref.watch(learningInitializedProvider.future);

  final subjects = await ref.watch(learningRepositoryProvider).getSubjects();

  return subjects.whereType<Subject>().toList();
});

final chaptersProvider =
    FutureProvider.family<List<Chapter>, int>((ref, subjectId) async {
  await ref.watch(learningInitializedProvider.future);

  final chapters =
      await ref.watch(learningRepositoryProvider).getChapters(subjectId);

  return chapters.whereType<Chapter>().toList();
});

final learningUnitsProvider =
    FutureProvider.family<List<LearningUnit>, int>((ref, chapterId) async {
  await ref.watch(learningInitializedProvider.future);

  final units =
      await ref.watch(learningRepositoryProvider).getLearningUnits(chapterId);

  return units.whereType<LearningUnit>().toList();
});

final contentBlocksProvider = FutureProvider.family<List<ContentBlock>, int>(
  (ref, learningUnitId) async {
    await ref.watch(learningInitializedProvider.future);

    final blocks = await ref.watch(learningRepositoryProvider).getContentBlocks(
          learningUnitId,
        );

    return blocks.whereType<ContentBlock>().toList();
  },
);

final knowledgeChecksProvider =
    FutureProvider.family<List<KnowledgeCheck>, int>(
  (ref, learningUnitId) async {
    await ref.watch(learningInitializedProvider.future);

    final checks =
        await ref.watch(learningRepositoryProvider).getKnowledgeChecks(
              learningUnitId,
            );

    return checks.whereType<KnowledgeCheck>().toList();
  },
);
