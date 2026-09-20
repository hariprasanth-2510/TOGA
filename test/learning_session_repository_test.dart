import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:toga/database/app_database.dart';
import 'package:toga/features/learning/data/repositories/learning_session_repository.dart';

void main() {
  late AppDatabase database;
  late LearningSessionRepository repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = LearningSessionRepository(database);
  });

  tearDown(() => database.close());

  test('persists learning progress for later resume', () async {
    final session = await repository.startOrResume(
      subjectId: 1,
      chapterId: 2,
      learningUnitId: 3,
    );

    await repository.updateSession(
      id: session.id,
      scrollPosition: 384.5,
      progress: 0.75,
      completed: true,
      totalStudySeconds: 540,
    );

    final restored = await repository.getSession(3);

    expect(restored, isNotNull);
    expect(restored!.subjectId, 1);
    expect(restored.chapterId, 2);
    expect(restored.learningUnitId, 3);
    expect(restored.scrollPosition, 384.5);
    expect(restored.progress, 0.75);
    expect(restored.completed, isTrue);
    expect(restored.totalStudySeconds, 540);
    expect(restored.sessionStartedAt, isNotNull);
    expect(restored.lastActivityAt, isNotNull);
  });
}
