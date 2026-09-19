import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/learning_provider.dart';

class ChapterScreen extends ConsumerWidget {
  const ChapterScreen({required this.subjectId, super.key});

  final int subjectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapters = ref.watch(chaptersProvider(subjectId));

    return Scaffold(
      appBar: AppBar(title: const Text('Chapters')),
      body: chapters.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: FilledButton.icon(
            onPressed: () => ref.invalidate(chaptersProvider(subjectId)),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
          ),
        ),
        data: (items) => ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final chapter = items[index];
            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.all(18),
                leading: Text(
                  '${index + 1}'.padLeft(2, '0'),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                title: Text(
                  chapter.title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: chapter.description == null
                    ? null
                    : Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(chapter.description!),
                      ),
                trailing: const Icon(Icons.chevron_right_rounded),
                onTap: () => context.push(
                  '/learn/subject/$subjectId/chapter/${chapter.id}',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
