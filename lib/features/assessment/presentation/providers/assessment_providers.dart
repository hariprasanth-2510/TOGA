import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../learning/presentation/providers/learning_provider.dart';
import '../../data/models/assessment_models.dart';
import '../../data/repositories/assessment_repository.dart';
import '../../domain/services/assessment_service.dart';

final assessmentRepositoryProvider = Provider<AssessmentRepository>((ref) {
  return AssessmentRepository(ref.watch(appDatabaseProvider));
});

final assessmentServiceProvider = Provider<AssessmentService>((ref) {
  return AssessmentService(ref.watch(assessmentRepositoryProvider));
});

final activeAssessmentProvider = FutureProvider<AssessmentAttempt?>((ref) {
  return ref.watch(assessmentServiceProvider).recoverActiveAttempt();
});

final assessmentAttemptProvider =
    FutureProvider.family<AssessmentAttempt?, String>((ref, attemptId) {
  return ref.watch(assessmentRepositoryProvider).getAttempt(attemptId);
});
