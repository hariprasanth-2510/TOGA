import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

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
      : super(executor ?? NativeDatabase(File('toga.sqlite')));

  @override
  int get schemaVersion => 1;
}
