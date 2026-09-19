import 'package:drift/drift.dart';

class Subjects extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();
}

class Chapters extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get subjectId => integer()();

  TextColumn get title => text()();

  TextColumn get description => text().nullable()();

  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

class LearningUnits extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get chapterId => integer()();

  TextColumn get title => text()();

  TextColumn get summary => text().nullable()();

  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

class ContentBlocks extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get learningUnitId => integer()();

  TextColumn get blockType => text()();

  TextColumn get contentText => text()();

  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}

class KnowledgeChecks extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get learningUnitId => integer()();

  TextColumn get question => text()();

  TextColumn get optionsJson => text()();

  IntColumn get correctOptionIndex => integer()();

  TextColumn get explanation => text().nullable()();
}
