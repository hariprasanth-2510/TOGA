import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/learning_provider.dart';

class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  bool _resumePromptDismissed = false;

  @override
  Widget build(BuildContext context) {
    final ref = this.ref;
    final subjects = ref.watch(subjectsProvider);
    final latestSession = ref.watch(latestLearningSessionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
        actions: [
          IconButton(
            tooltip: 'Refresh learning content',
            onPressed: () => ref.invalidate(subjectsProvider),
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: subjects.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ErrorState(
          message: 'Unable to load learning content. Please retry.',
          onRetry: () => ref.invalidate(subjectsProvider),
        ),
        data: (items) => ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          children: [
            latestSession.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (session) {
                if (session == null || _resumePromptDismissed) {
                  return const SizedBox.shrink();
                }

                return Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.play_circle_outline_rounded),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Continue where you left off?',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'You were learning:',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 4),
                        Consumer(
                          builder: (context, ref, _) {
                            final unit = ref.watch(
                              learningUnitByIdProvider(session.learningUnitId),
                            );

                            return unit.when(
                              loading: () =>
                                  const Text('Loading learning unit...'),
                              error: (_, __) =>
                                  const Text('Previous learning unit'),
                              data: (value) => Text(
                                value?.title ?? 'Previous learning unit',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() => _resumePromptDismissed = true);
                                },
                                child: const Text('No, stay here'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: FilledButton(
                                onPressed: () {
                                  context.push(
                                    '/learn/subject/${session.subjectId}/chapter/${session.chapterId}/unit/${session.learningUnitId}',
                                  );
                                },
                                child: const Text('Yes, continue'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Text(
              'Training library',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Continue your aviation learning from the local training library.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            ...items.map(
              (subject) => Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(18),
                  leading: const CircleAvatar(
                    child: Icon(Icons.flight_takeoff_rounded),
                  ),
                  title: Text(
                    subject.title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: subject.description == null
                      ? null
                      : Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(subject.description!),
                        ),
                  trailing: const Icon(Icons.chevron_right_rounded),
                  onTap: () => context.push('/learn/subject/${subject.id}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_rounded, size: 42),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
