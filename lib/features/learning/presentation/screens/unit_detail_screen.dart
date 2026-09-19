import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/learning_provider.dart';

class UnitDetailScreen extends ConsumerWidget {
  const UnitDetailScreen({required this.unitId, super.key});

  final int unitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocks = ref.watch(contentBlocksProvider(unitId));
    final checks = ref.watch(knowledgeChecksProvider(unitId));

    return Scaffold(
      appBar: AppBar(title: const Text('Learning Unit')),
      body: blocks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: FilledButton.icon(
            onPressed: () => ref.invalidate(contentBlocksProvider(unitId)),
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
          ),
        ),
        data: (items) => ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
          children: [
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
              data: (items) => Column(
                children: items
                    .map((check) => _KnowledgeCheckPreview(check: check))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KnowledgeCheckPreview extends StatelessWidget {
  const _KnowledgeCheckPreview({required this.check});

  final dynamic check;

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
              check.question as String,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${(check.options as List<String>).length} answer options',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
