import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// UI-facing state for the API-ready sync boundary. Local writes complete first;
/// a production SyncService can replace `complete` with an acknowledged upload.
enum SyncStatus { synced, pending, syncing, failed }

class SyncController extends StateNotifier<SyncStatus> {
  SyncController() : super(SyncStatus.pending);

  void begin() => state = SyncStatus.syncing;
  void pending() => state = SyncStatus.pending;
  void fail() => state = SyncStatus.failed;

  /// The assessment has no backend endpoint. This is a mock acknowledgement
  /// that checks usable connectivity asynchronously, so offline local saves
  /// are correctly labelled pending instead of falsely labelled synced.
  Future<void> syncLocalChange() async {
    begin();
    try {
      final result = await InternetAddress.lookup('one.one.one.one')
          .timeout(const Duration(seconds: 3));
      state = result.isEmpty ? SyncStatus.pending : SyncStatus.synced;
    } on SocketException {
      pending();
    } on TimeoutException {
      pending();
    } catch (_) {
      fail();
    }
  }

  Future<void> retry() => syncLocalChange();
}

final syncStatusProvider = StateNotifierProvider<SyncController, SyncStatus>(
  (ref) => SyncController(),
);
