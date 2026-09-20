import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/assessment_providers.dart';

class AssessmentConfigScreen extends ConsumerWidget {
  const AssessmentConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(activeAssessmentProvider);
    final config = ref.watch(assessmentServiceProvider).config;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => context.go('/'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Practice assessment'),
          leading: IconButton(
            tooltip: 'Back to home',
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text('Radio Navigation Assessment',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(
                '${config.questionCount} questions • ${config.duration.inMinutes} minutes • ${(config.passMark * 100).round()}% to pass'),
            const SizedBox(height: 24),
            active.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Unable to restore an assessment.'),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () => ref.invalidate(activeAssessmentProvider),
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Retry'),
                  ),
                  if (error is StateError)
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
                      child:
                          Text('The saved assessment is no longer available.'),
                    ),
                ],
              ),
              data: (attempt) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (attempt != null) ...[
                    const Text('Assessment in progress',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    FilledButton(
                      onPressed: () =>
                          context.push('/assessment/${attempt.id}'),
                      child: const Text('Resume Assessment'),
                    ),
                    const SizedBox(height: 12),
                  ],
                  OutlinedButton(
                    onPressed: attempt != null
                        ? null
                        : () async {
                            final created = await ref
                                .read(assessmentServiceProvider)
                                .start();
                            if (context.mounted) {
                              context.push('/assessment/${created.id}');
                            }
                          },
                    child: const Text('Start Assessment'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
