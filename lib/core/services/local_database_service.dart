import '../../database/app_database.dart';

class LocalDatabaseService {
  LocalDatabaseService({
    AppDatabase? database,
  }) : _database = database ?? AppDatabase();

  final AppDatabase _database;

  AppDatabase get database => _database;

  bool get isInitialized => true;

  Future<void> close() => _database.close();
}
