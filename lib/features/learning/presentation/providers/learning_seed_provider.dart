import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/seed/learning_seed_service.dart';

final learningSeedServiceProvider = Provider<LearningSeedService>(
  (ref) => const LearningSeedService(),
);
