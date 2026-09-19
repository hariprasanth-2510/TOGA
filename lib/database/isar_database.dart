import 'package:isar/isar.dart';

class IsarDatabase {
  IsarDatabase._();

  static final IsarDatabase instance = IsarDatabase._();

  Isar? _isar;

  Isar get database {
    final database = _isar;
    if (database == null) {
      throw StateError(
        'IsarDatabase has not been initialized. Call initialize() first.',
      );
    }
    return database;
  }

  bool get isInitialized => _isar?.isOpen ?? false;

  Future<void> initialize({
    String? directory,
  }) async {
    if (_isar?.isOpen ?? false) {
      return;
    }

    _isar = await Isar.open(
      const [],
      directory: directory,
      name: 'toga',
    );
  }

  Future<void> close() async {
    final database = _isar;
    if (database == null) {
      return;
    }

    await database.close();
    _isar = null;
  }
}
