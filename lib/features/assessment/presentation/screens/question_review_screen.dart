import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/assessment_providers.dart';

class QuestionReviewScreen extends ConsumerWidget {
  const QuestionReviewScreen({required this.attemptId, super.key});
  final String attemptId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => context.go('/assessment'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Question review'),
          leading: IconButton(
            tooltip: 'Back to assessment results',
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/assessment/$attemptId/results'),
          ),
          actions: [
            TextButton(
              onPressed: () => context.go('/assessment'),
              child: const Text('Practice'),
            ),
          ],
        ),
        body: FutureBuilder(
          future: ref.read(assessmentServiceProvider).resultFor(attemptId),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text('Unable to load review: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final result = snapshot.data!;
            return ListView.separated(
              padding: const EdgeInsets.all(20),
              itemCount: result.questions.length + 1,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (index == result.questions.length) {
                  return OutlinedButton.icon(
                    onPressed: () => context.go('/assessment'),
                    icon: const Icon(Icons.quiz_outlined),
                    label: const Text('Back to practice assessment'),
                  );
                }
                final item = result.questions[index];
                final question = item.question;
                final selected = item.selectedOptionIndex;
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              item.isCorrect
                                  ? Icons.check_circle_rounded
                                  : Icons.cancel_rounded,
                              color: item.isCorrect
                                  ? Colors.green
                                  : Theme.of(context).colorScheme.error,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Text(
                                    '${question.topic} · ${question.difficulty}')),
                            Text('Question ${index + 1}'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(question.text,
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 12),
                        Text(
                            'Your answer: ${selected == null ? 'Unanswered' : question.options[selected]}'),
                        Text(
                            'Correct answer: ${question.options[question.correctOptionIndex]}',
                            style:
                                const TextStyle(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 8),
                        Text(question.explanation),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
