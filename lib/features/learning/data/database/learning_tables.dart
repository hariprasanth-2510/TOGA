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

class LearningSessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subjectId => integer()();
  IntColumn get chapterId => integer()();
  IntColumn get learningUnitId => integer()();
  RealColumn get scrollPosition => real().withDefault(const Constant(0))();
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
  RealColumn get progress => real().withDefault(const Constant(0))();
  DateTimeColumn get sessionStartedAt => dateTime().nullable()();
  IntColumn get totalStudySeconds => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastActivityAt => dateTime().nullable()();
}

/// Learner-authored data is deliberately separate from the seeded content so
/// a future content refresh can never overwrite a note or bookmark.
class UnitPersonalData extends Table {
  IntColumn get learningUnitId => integer()();
  BoolColumn get bookmarked => boolean().withDefault(const Constant(false))();
  TextColumn get note => text().nullable()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {learningUnitId};
}

class KnowledgeCheckAttempts extends Table {
  IntColumn get knowledgeCheckId => integer()();
  IntColumn get selectedOptionIndex => integer()();
  BoolColumn get isCorrect => boolean()();
  DateTimeColumn get answeredAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {knowledgeCheckId};
}
