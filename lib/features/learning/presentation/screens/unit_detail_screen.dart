import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/learning_models.dart';
import '../providers/learning_provider.dart';

class UnitDetailScreen extends ConsumerStatefulWidget {
  const UnitDetailScreen({
    required this.subjectId,
    required this.chapterId,
    required this.unitId,
    super.key,
  });

  final int subjectId;
  final int chapterId;
  final int unitId;

  @override
  ConsumerState<UnitDetailScreen> createState() => _UnitDetailScreenState();
}

class _UnitDetailScreenState extends ConsumerState<UnitDetailScreen>
    with WidgetsBindingObserver {
  final ScrollController _scrollController = ScrollController();

  LearningSession? _session;
  Timer? _clockTimer;
  Timer? _saveTimer;
  DateTime? _activeSince;

  int _persistedStudySeconds = 0;
  int _displayStudySeconds = 0;
  double _progress = 0;
  bool _completed = false;
  bool _sessionReady = false;
  bool _saving = false;
  bool _scrollPositionRestored = false;
  bool _scrollRestoreScheduled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_handleScroll);
    _clockTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _tickClock(),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _scrollController.removeListener(_handleScroll);
    _clockTimer?.cancel();
    _saveTimer?.cancel();
    _persistSession();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _pauseClock();
      _persistSession();
    } else if (state == AppLifecycleState.resumed && _sessionReady) {
      _activeSince = DateTime.now();
    }
  }

  Future<void> _initializeSession(LearningSession? existing) async {
    if (_sessionReady) return;

    final repository = ref.read(learningSessionRepositoryProvider);
    final session = existing ??
        await repository.startOrResume(
          subjectId: widget.subjectId,
          chapterId: widget.chapterId,
          learningUnitId: widget.unitId,
        );

    if (!mounted) return;

    setState(() {
      _session = session;
      _persistedStudySeconds = session.totalStudySeconds;
      _displayStudySeconds = session.totalStudySeconds;
      _progress = session.progress;
      _completed = session.completed;
      _sessionReady = true;
      _activeSince = DateTime.now();
    });

    // The Learn screen may already have cached an empty result before this
    // first session was created. Refresh it so returning there discovers the
    // newly resumable unit.
    ref.invalidate(latestLearningSessionProvider);
  }

  void _restoreScrollPositionAfterLayout() {
    if (!_sessionReady ||
        _scrollPositionRestored ||
        _scrollRestoreScheduled) {
      return;
    }

    _scrollRestoreScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollRestoreScheduled = false;
      if (!mounted || !_scrollController.hasClients) return;

      final savedPosition = _session?.scrollPosition ?? 0;
      final max = _scrollController.position.maxScrollExtent;
      final target = savedPosition.clamp(0.0, max).toDouble();
      if (target > 0) {
        _scrollController.jumpTo(target);
      }
      _scrollPositionRestored = true;
      _updateProgress();
    });
  }

  void _tickClock() {
    if (!_sessionReady || _activeSince == null) return;

    final elapsed = DateTime.now().difference(_activeSince!).inSeconds;
    final total = _persistedStudySeconds + elapsed;

    if (!mounted) return;

    setState(() {
      _displayStudySeconds = total;
    });
  }

  void _pauseClock() {
    if (_activeSince == null) return;

    _persistedStudySeconds +=
        DateTime.now().difference(_activeSince!).inSeconds;
    _displayStudySeconds = _persistedStudySeconds;
    _activeSince = null;
  }

  void _handleScroll() {
    if (!_sessionReady) return;
    _updateProgress();

    _saveTimer?.cancel();
    _saveTimer = Timer(
      const Duration(milliseconds: 500),
      _persistSession,
    );
  }

  void _updateProgress() {
    if (!_scrollController.hasClients || !mounted) return;

    final max = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;

    // If the unit fits on one screen, completion is explicit. For
    // scrollable units, reading position maps directly to progress.
    final next = max <= 0
        ? _progress
        : (offset / max).clamp(0.0, 1.0);

    setState(() {
      _progress = _completed ? 1.0 : next;
      if (_progress >= 0.98) {
        _progress = 1.0;
        _completed = true;
      }
    });
  }

  Future<void> _markComplete() async {
    if (!_sessionReady) return;

    setState(() {
      _completed = true;
      _progress = 1.0;
    });

    await _persistSession();
  }

  Future<void> _persistSession() async {
    final session = _session;
    if (session == null || _saving) return;

    _saving = true;
    try {
      final position = _scrollController.hasClients
          ? _scrollController.offset
          : session.scrollPosition;

      final max = _scrollController.hasClients
          ? _scrollController.position.maxScrollExtent
          : 0.0;

      final calculated = max <= 0
          ? _progress
          : (position / max).clamp(0.0, 1.0);

      final progress = _completed ? 1.0 : calculated;
      final completed = _completed || progress >= 0.98;

      var total = _persistedStudySeconds;
      final persistedAt = DateTime.now();
      if (_activeSince != null) {
        total += persistedAt.difference(_activeSince!).inSeconds;
      }

      await ref.read(learningSessionRepositoryProvider).updateSession(
            id: session.id,
            scrollPosition: position,
            progress: progress,
            completed: completed,
            totalStudySeconds: total,
          );

      _persistedStudySeconds = total;
      _displayStudySeconds = total;
      // Move the baseline forward after every save. Without this, each
      // debounced scroll save adds the same elapsed interval repeatedly.
      if (_activeSince != null) {
        _activeSince = persistedAt;
      }

      if (mounted) {
        setState(() {
          _progress = progress;
          _completed = completed;
        });
      }

      if (mounted) {
        ref.invalidate(learningSessionProvider(widget.unitId));
        ref.invalidate(latestLearningSessionProvider);
      }
    } finally {
      _saving = false;
    }
  }

  Future<void> _openUnit(int unitId) async {
    await _persistSession();
    if (!mounted) return;

    context.pushReplacement(
      '/learn/subject/${widget.subjectId}/chapter/${widget.chapterId}/unit/$unitId',
    );
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remaining = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${remaining.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final blocks = ref.watch(contentBlocksProvider(widget.unitId));
    final checks = ref.watch(knowledgeChecksProvider(widget.unitId));
    final session = ref.watch(learningSessionProvider(widget.unitId));
    final units = ref.watch(learningUnitsProvider(widget.chapterId));

    session.whenData((value) {
      if (!_sessionReady) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => _initializeSession(value),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Unit'),
        actions: [
          if (_completed)
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.check_circle_rounded),
            ),
        ],
      ),
      body: blocks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: FilledButton.icon(
            onPressed: () =>
                ref.invalidate(contentBlocksProvider(widget.unitId)),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
          ),
        ),
        data: (items) {
          _restoreScrollPositionAfterLayout();
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${(_progress * 100).round()}% complete',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        Text(
                          _completed ? 'Completed' : 'In progress',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(value: _progress),
                    const SizedBox(height: 8),
                    Text(
                      'Study time: ${_formatDuration(_displayStudySeconds)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  ...items.map(
                    (block) => Padding(
                      padding: const EdgeInsets.only(bottom: 18),
                      child: Text(
                        block.contentText,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              height: 1.6,
                            ),
                      ),
                    ),
                  ),
                  checks.when(
                    loading: () => const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: LinearProgressIndicator(),
                    ),
                    error: (_, __) => const SizedBox.shrink(),
                    data: (checkItems) => Column(
                      children: checkItems
                          .map(
                            (check) => _KnowledgeCheckPreview(check: check),
                          )
                          .toList(),
                    ),
                  ),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: units.when(
                loading: () => const Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 32),
                  child: LinearProgressIndicator(),
                ),
                error: (_, __) => const SizedBox.shrink(),
                data: (unitItems) => _UnitNavigation(
                  units: unitItems,
                  currentUnitId: widget.unitId,
                  onUnitSelected: _openUnit,
                  onComplete: _markComplete,
                  completed: _completed,
                ),
              ),
            ),
            ],
          );
        },
      ),
    );
  }
}

class _UnitNavigation extends StatelessWidget {
  const _UnitNavigation({
    required this.units,
    required this.currentUnitId,
    required this.onUnitSelected,
    required this.onComplete,
    required this.completed,
  });

  final List<LearningUnit> units;
  final int currentUnitId;
  final ValueChanged<int> onUnitSelected;
  final VoidCallback onComplete;
  final bool completed;

  @override
  Widget build(BuildContext context) {
    final index = units.indexWhere((unit) => unit.id == currentUnitId);
    final previous = index > 0 ? units[index - 1] : null;
    final next =
        index >= 0 && index < units.length - 1 ? units[index + 1] : null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 36),
      child: Column(
        children: [
          if (!completed)
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: onComplete,
                icon: const Icon(Icons.check_rounded),
                label: const Text('Mark unit complete'),
              ),
            ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: previous == null
                      ? null
                      : () => onUnitSelected(previous.id),
                  icon: const Icon(Icons.arrow_back_rounded),
                  label: const Text('Previous'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
                  onPressed:
                      next == null ? null : () => onUnitSelected(next.id),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: Text(next == null ? 'End' : 'Next'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KnowledgeCheckPreview extends StatelessWidget {
  const _KnowledgeCheckPreview({required this.check});

  final KnowledgeCheck check;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 12),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.quiz_outlined),
                SizedBox(width: 8),
                Text(
                  'Knowledge check',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              check.question,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${check.options.length} answer options',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
