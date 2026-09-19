abstract interface class SyncRepository {
  Future<void> enqueuePendingChange();
  Future<void> processQueue();
}
