import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../learning/presentation/providers/learning_provider.dart';
import '../data/local_sync_queue_repository.dart';
/// UI-facing state for the API-ready sync boundary. Local writes complete first;
/// a production SyncService can replace `complete` with an acknowledged upload.
enum SyncStatus { synced, pending, syncing, failed }

class SyncController extends StateNotifier<SyncStatus> {
  SyncController(this._queue) : super(SyncStatus.pending);

  final LocalSyncQueueRepository _queue;

  void begin() => state = SyncStatus.syncing;
  void pending() => state = SyncStatus.pending;
  void fail() => state = SyncStatus.failed;

  Future<void> queueLearningProgress(int learningUnitId) async {
    await _queue.enqueue('learning-unit-$learningUnitId');
    pending();
    await syncLocalChange();
  }

  /// Mock acknowledgement boundary. Production sync would upload each queued
  /// idempotency key before removing it from the local outbox.
  Future<void> syncLocalChange() async {
    begin();
    try {
      final result = await InternetAddress.lookup('one.one.one.one')
          .timeout(const Duration(seconds: 3));
      if (result.isEmpty) {
        pending();
        return;
      }
      await _queue.acknowledgeAll();
      state = SyncStatus.synced;
    } on SocketException {
      pending();
    } on TimeoutException {
      pending();
    } catch (_) {
      await _queue.markRetry();
      fail();
    }
  }

  Future<void> retry() => syncLocalChange();
}

final syncStatusProvider = StateNotifierProvider<SyncController, SyncStatus>(
  (ref) => SyncController(
    LocalSyncQueueRepository(ref.watch(appDatabaseProvider)),
  ),
);
