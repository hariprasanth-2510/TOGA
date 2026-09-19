import '../../../../database/app_database.dart';
import '../../data/seed/learning_seed_service.dart';

class LocalLearningService {
  LocalLearningService({
    required AppDatabase database,
    required LearningSeedService seedService,
  })  : _database = database,
        _seedService = seedService;

  final AppDatabase _database;
  final LearningSeedService _seedService;

  Future<void> initialize() {
    return _seedService.seedRadioNavigation(_database);
  }
}
