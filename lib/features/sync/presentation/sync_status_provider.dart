import 'package:flutter_riverpod/flutter_riverpod.dart';

/// UI-facing state for the API-ready sync boundary. Local writes complete first;
/// a production SyncService can replace `complete` with an acknowledged upload.
enum SyncStatus { synced, pending, syncing, failed }

class SyncController extends StateNotifier<SyncStatus> {
  SyncController() : super(SyncStatus.synced);

  void begin() => state = SyncStatus.syncing;
  void pending() => state = SyncStatus.pending;
  void complete() => state = SyncStatus.synced;
  void fail() => state = SyncStatus.failed;
}

final syncStatusProvider = StateNotifierProvider<SyncController, SyncStatus>(
  (ref) => SyncController(),
);
