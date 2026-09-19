import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../database/app_database.dart';
import '../../data/seed/learning_seed_service.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();

  ref.onDispose(database.close);

  return database;
});

final learningSeedServiceProvider = Provider<LearningSeedService>((ref) {
  return const LearningSeedService();
});
