import 'package:drift/drift.dart';

class AssessmentAttempts extends Table {
  TextColumn get id => text()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get deadlineAt => dateTime()();
  DateTimeColumn get submittedAt => dateTime().nullable()();
  TextColumn get status => text()();
  IntColumn get currentQuestionIndex =>
      integer().withDefault(const Constant(0))();
  TextColumn get questionOrderJson => text()();
  TextColumn get optionOrderJson => text().withDefault(const Constant('{}'))();
  TextColumn get flaggedQuestionIdsJson =>
      text().withDefault(const Constant('[]'))();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

class AssessmentAnswers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get attemptId => text()();
  TextColumn get questionId => text()();
  IntColumn get selectedOptionIndex => integer().nullable()();
}
