import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../features/learning/data/database/learning_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Subjects,
    Chapters,
    LearningUnits,
    ContentBlocks,
    KnowledgeChecks,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(
          executor ?? LazyDatabase(_openConnection),
        );

  static Future<QueryExecutor> _openConnection() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/toga.sqlite');

    return NativeDatabase.createInBackground(file);
  }

  @override
  int get schemaVersion => 1;
}
