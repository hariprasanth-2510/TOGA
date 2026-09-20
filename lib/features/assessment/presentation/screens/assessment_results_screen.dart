import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../learning/presentation/providers/learning_provider.dart';
import '../providers/assessment_providers.dart';

class AssessmentResultsScreen extends ConsumerWidget {
  const AssessmentResultsScreen({required this.attemptId, super.key});
  final String attemptId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => context.go('/assessment'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Assessment results'),
          leading: IconButton(
            tooltip: 'Back to practice assessment',
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/assessment'),
          ),
        ),
        body: FutureBuilder(
          future: ref.read(assessmentServiceProvider).resultFor(attemptId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final result = snapshot.data!;
            final weakest = result.weakestTopic;
            return ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Text(result.passed ? 'Passed' : 'Failed',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 8),
                Text(
                    '${(result.percentage * 100).round()}% • ${result.rawScore}/${result.totalMarks} correct'),
                Text(
                    '${result.correctCount} correct · ${result.incorrectCount} incorrect · ${result.unansweredCount} unanswered'),
                Text(
                    'Time taken: ${result.timeTaken.inMinutes}m ${result.timeTaken.inSeconds % 60}s'),
                const SizedBox(height: 16),
                FilledButton.tonalIcon(
                  onPressed: () =>
                      context.push('/assessment/$attemptId/review'),
                  icon: const Icon(Icons.rate_review_outlined),
                  label: const Text('Review answers'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () => context.go('/assessment'),
                  icon: const Icon(Icons.quiz_outlined),
                  label: const Text('Back to practice assessment'),
                ),
                const SizedBox(height: 24),
                Text('Topic analytics',
                    style: Theme.of(context).textTheme.titleLarge),
                ...result.topicAccuracy.map((topic) => ListTile(
                      title: Text(topic.topic),
                      trailing: Text('${(topic.percentage * 100).round()}%'),
                      subtitle:
                          LinearProgressIndicator(value: topic.percentage),
                    )),
                if (weakest != null)
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.menu_book_outlined),
                      title: Text('Needs revision: ${weakest.topic}'),
                      subtitle: const Text(
                          'Review the matching Radio Navigation learning unit.'),
                      onTap: () async {
                        final question = result.questions
                            .firstWhere(
                                (item) => item.question.topic == weakest.topic)
                            .question;
                        final learningRepository =
                            ref.read(learningRepositoryProvider);
                        final unit =
                            (await learningRepository.getAllLearningUnits())
                                .where((unit) =>
                                    unit.title == question.learningUnitTitle)
                                .firstOrNull;
                        final subject = (await learningRepository.getSubjects())
                            .where(
                                (subject) => subject.title == 'Air Navigation')
                            .firstOrNull;
                        if (unit == null ||
                            subject == null ||
                            !context.mounted) {
                          return;
                        }
                        context.go(
                            '/learn/subject/${subject.id}/chapter/${unit.chapterId}/unit/${unit.id}');
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
