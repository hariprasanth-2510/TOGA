import '../../../database/app_database.dart';

/// A lightweight SQLite outbox for API-ready local-first mutations.
/// `changeKey` is the idempotency key: repeated saves of a unit coalesce.
class LocalSyncQueueRepository {
  LocalSyncQueueRepository(this._database);

  final AppDatabase _database;
  bool _initialized = false;

  Future<void> enqueue(String changeKey) async {
    await _ensureTable();
    await _database.customStatement(
      'INSERT INTO pending_sync_changes (change_key, queued_at, retry_count) '
      'VALUES (?, ?, 0) '
      'ON CONFLICT(change_key) DO UPDATE SET queued_at = excluded.queued_at',
      [changeKey, DateTime.now().millisecondsSinceEpoch],
    );
  }

  Future<void> markRetry() async {
    await _ensureTable();
    await _database.customStatement(
      'UPDATE pending_sync_changes SET retry_count = retry_count + 1',
    );
  }

  Future<void> acknowledgeAll() async {
    await _ensureTable();
    await _database.customStatement('DELETE FROM pending_sync_changes');
  }

  Future<int> pendingCount() async {
    await _ensureTable();
    final row = await _database
        .customSelect('SELECT COUNT(*) AS count FROM pending_sync_changes')
        .getSingle();
    return row.read<int>('count');
  }

  Future<void> _ensureTable() async {
    if (_initialized) return;
    await _database.customStatement(
      'CREATE TABLE IF NOT EXISTS pending_sync_changes ('
      'change_key TEXT PRIMARY KEY, queued_at INTEGER NOT NULL, '
      'retry_count INTEGER NOT NULL DEFAULT 0)',
    );
    _initialized = true;
  }
}
