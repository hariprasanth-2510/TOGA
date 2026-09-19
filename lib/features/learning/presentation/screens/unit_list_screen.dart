import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/learning_provider.dart';

class UnitListScreen extends ConsumerWidget {
  const UnitListScreen({
    required this.subjectId,
    required this.chapterId,
    super.key,
  });

  final int subjectId;
  final int chapterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final units = ref.watch(learningUnitsProvider(chapterId));

    return Scaffold(
      appBar: AppBar(title: const Text('Learning Units')),
      body: units.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: FilledButton.icon(
            onPressed: () => ref.invalidate(learningUnitsProvider(chapterId)),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
          ),
        ),
        data: (items) => ListView.separated(
          padding: const EdgeInsets.all(20),
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final unit = items[index];
            return Card(
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  unit.title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: unit.summary == null
                    ? const Text('Learning unit')
                    : Text(unit.summary!),
                trailing: const Icon(Icons.play_arrow_rounded),
                onTap: () => context.push(
                  '/learn/subject/$subjectId/chapter/$chapterId/unit/${unit.id}',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
