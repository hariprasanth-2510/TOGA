import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../features/learning/data/database/learning_tables.dart';
import '../features/assessment/data/database/assessment_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Subjects,
    Chapters,
    LearningUnits,
    ContentBlocks,
    KnowledgeChecks,
    LearningSessions,
    UnitPersonalData,
    KnowledgeCheckAttempts,
    AssessmentAttempts,
    AssessmentAnswers,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? LazyDatabase(_openConnection));

  static Future<QueryExecutor> _openConnection() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/toga.sqlite');
    return NativeDatabase.createInBackground(file);
  }

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async => m.createAll(),
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.createTable(learningSessions);
          }
          if (from < 3) {
            await m.createTable(assessmentAttempts);
            await m.createTable(assessmentAnswers);
          } else if (from < 4) {
            // A v2 database receives the current table definition above,
            // including this column. Only v3 needs an ALTER TABLE.
            await m.addColumn(
                assessmentAttempts, assessmentAttempts.optionOrderJson);
          }
          if (from < 5) {
            await m.createTable(unitPersonalData);
            await m.createTable(knowledgeCheckAttempts);
          }
        },
      );
}
