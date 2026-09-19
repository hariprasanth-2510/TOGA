import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../database/app_database.dart';
import '../../data/repositories/learning_repository.dart';
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

final learningServiceProvider = Provider<LocalLearningService>((ref) {
  return LocalLearningService(
    database: ref.watch(appDatabaseProvider),
    seedService: ref.watch(learningSeedServiceProvider),
  );
});
