import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toga/database/app_database.dart';
import 'package:toga/features/sync/data/local_sync_queue_repository.dart';

void main() {
  test('coalesces repeated changes and clears only after acknowledgement', () async {
    final database = AppDatabase(NativeDatabase.memory());
    addTearDown(database.close);
    final queue = LocalSyncQueueRepository(database);

    await queue.enqueue('learning-unit-7');
    await queue.enqueue('learning-unit-7');
    expect(await queue.pendingCount(), 1);

    await queue.markRetry();
    expect(await queue.pendingCount(), 1);

    await queue.acknowledgeAll();
    expect(await queue.pendingCount(), 0);
  });
}
