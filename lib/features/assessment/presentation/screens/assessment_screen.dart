import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/assessment_models.dart';
import '../providers/assessment_providers.dart';

class AssessmentScreen extends ConsumerStatefulWidget {
  const AssessmentScreen({required this.attemptId, super.key});
  final String attemptId;

  @override
  ConsumerState<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends ConsumerState<AssessmentScreen> {
  Timer? _timer;
  final ValueNotifier<DateTime> _clock = ValueNotifier(DateTime.now());
  AssessmentAttempt? _loadedAttempt;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    // Do not poll SQLite every second for a visual clock. Drift already runs
    // native database I/O off the UI isolate; this clock only repaints its
    // small text widget and uses the persisted deadline as its source of truth.
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now();
      _clock.value = now;
      final attempt = _loadedAttempt;
      if (attempt != null &&
          attempt.remainingAt(now) == Duration.zero &&
          !_submitting) {
        unawaited(_submit(attempt));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _clock.dispose();
    super.dispose();
  }

  Future<void> _submit(AssessmentAttempt attempt) async {
    if (_submitting) return;
    _submitting = true;
    final service = ref.read(assessmentServiceProvider);
    try {
      final submitted = await service.submit(attempt.id);
      ref.invalidate(activeAssessmentProvider);
      // The Home dashboard may still be mounted beneath this route. Refresh
      // its persisted-attempt aggregate as soon as submission succeeds.
      ref.invalidate(assessmentAnalyticsProvider);
      if (mounted) context.go('/assessment/${submitted.id}/results');
    } finally {
      _submitting = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final attemptAsync = ref.watch(assessmentAttemptProvider(widget.attemptId));
    final service = ref.watch(assessmentServiceProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Assessment')),
      body: attemptAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            Center(child: Text('Unable to load assessment: $error')),
        data: (attempt) {
          if (attempt == null) {
            return const Center(child: Text('Assessment not found.'));
          }
          _loadedAttempt = attempt;
          if (!attempt.isEditable ||
              attempt.remainingAt(DateTime.now()) == Duration.zero) {
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _submit(attempt));
            return const Center(child: CircularProgressIndicator());
          }
          final questions = service.questionsFor(attempt);
          final index = attempt.currentQuestionIndex
              .clamp(0, questions.length - 1)
              .toInt();
          final question = questions[index];
          final answered = attempt.answers.containsKey(question.id);
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(children: [
                Expanded(
                    child:
                        Text('Question ${index + 1} of ${questions.length}')),
                ValueListenableBuilder<DateTime>(
                  valueListenable: _clock,
                  builder: (_, now, __) => Text(
                    _format(attempt.remainingAt(now)),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              const SizedBox(height: 12),
              LinearProgressIndicator(value: (index + 1) / questions.length),
              const SizedBox(height: 24),
              Text(question.text,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              RadioGroup<int>(
                groupValue: attempt.answers[question.id],
                onChanged: (value) {
                  unawaited(_saveAnswer(attempt, question.id, value));
                },
                child: Column(
                  children: question.options.indexed
                      .map((option) => RadioListTile<int>(
                            value: option.$1,
                            title: Text(option.$2),
                          ))
                      .toList(),
                ),
              ),
              Row(children: [
                TextButton.icon(
                  onPressed: () async {
                    await service.toggleFlag(attempt, question.id);
                    ref.invalidate(assessmentAttemptProvider(widget.attemptId));
                  },
                  icon: Icon(attempt.flaggedQuestionIds.contains(question.id)
                      ? Icons.flag
                      : Icons.outlined_flag),
                  label: Text(attempt.flaggedQuestionIds.contains(question.id)
                      ? 'Flagged'
                      : 'Flag for review'),
                ),
                const Spacer(),
                Text('${index + 1} ${answered ? 'answered' : 'unanswered'}'),
              ]),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: questions.indexed
                    .map((item) => OutlinedButton(
                          onPressed: () async {
                            await service.selectQuestion(attempt, item.$1);
                            ref.invalidate(
                                assessmentAttemptProvider(widget.attemptId));
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: item.$1 == index
                                ? Theme.of(context).colorScheme.primaryContainer
                                : attempt.flaggedQuestionIds
                                        .contains(item.$2.id)
                                    ? Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer
                                    : null,
                          ),
                          child: Text(
                              '${item.$1 + 1}${attempt.answers.containsKey(item.$2.id) ? ' •' : ''}'),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () => _confirmSubmit(context, attempt),
                child: const Text('Submit assessment'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _confirmSubmit(
      BuildContext context, AssessmentAttempt attempt) async {
    final unanswered = attempt.questionIds
        .where((id) => !attempt.answers.containsKey(id))
        .length;
    final proceed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Submit assessment?'),
        content: Text(
            '${attempt.answers.length} answered, $unanswered unanswered, ${attempt.flaggedQuestionIds.length} flagged.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Keep working')),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Submit'))
        ],
      ),
    );
    if (proceed == true) await _submit(attempt);
  }

  Future<void> _saveAnswer(
    AssessmentAttempt attempt,
    String questionId,
    int? value,
  ) async {
    if (value == null) return;
    await ref
        .read(assessmentServiceProvider)
        .answer(attempt, questionId, value);
    ref.invalidate(assessmentAttemptProvider(widget.attemptId));
  }

  String _format(Duration value) =>
      '${value.inMinutes.toString().padLeft(2, '0')}:${(value.inSeconds % 60).toString().padLeft(2, '0')}';
}
