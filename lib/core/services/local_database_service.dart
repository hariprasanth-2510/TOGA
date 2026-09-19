import '../../database/isar_database.dart';

class LocalDatabaseService {
  LocalDatabaseService({
    IsarDatabase? database,
  }) : _database = database ?? IsarDatabase.instance;

  final IsarDatabase _database;

  Future<void> initialize({
    String? directory,
  }) {
    return _database.initialize(directory: directory);
  }

  bool get isInitialized => _database.isInitialized;

  Future<void> close() => _database.close();
}
