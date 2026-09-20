class Subject {
  const Subject({required this.id, required this.title, this.description});
  final int id;
  final String title;
  final String? description;
}

class Chapter {
  const Chapter({
    required this.id,
    required this.subjectId,
    required this.title,
    this.description,
    this.sortOrder = 0,
  });
  final int id;
  final int subjectId;
  final String title;
  final String? description;
  final int sortOrder;
}

class LearningUnit {
  const LearningUnit({
    required this.id,
    required this.chapterId,
    required this.title,
    this.summary,
    this.sortOrder = 0,
  });
  final int id;
  final int chapterId;
  final String title;
  final String? summary;
  final int sortOrder;
}

class ContentBlock {
  const ContentBlock({
    required this.id,
    required this.learningUnitId,
    required this.blockType,
    required this.contentText,
    this.sortOrder = 0,
  });
  final int id;
  final int learningUnitId;
  final String blockType;
  final String contentText;
  final int sortOrder;
}

class KnowledgeCheck {
  const KnowledgeCheck({
    required this.id,
    required this.learningUnitId,
    required this.question,
    required this.options,
    required this.correctOptionIndex,
    this.explanation,
  });
  final int id;
  final int learningUnitId;
  final String question;
  final List<String> options;
  final int correctOptionIndex;
  final String? explanation;
}

class LearningSession {
  const LearningSession({
    required this.id,
    required this.subjectId,
    required this.chapterId,
    required this.learningUnitId,
    required this.scrollPosition,
    required this.completed,
    required this.progress,
    this.sessionStartedAt,
    required this.totalStudySeconds,
    this.lastActivityAt,
  });

  final int id;
  final int subjectId;
  final int chapterId;
  final int learningUnitId;
  final double scrollPosition;
  final bool completed;
  final double progress;
  final DateTime? sessionStartedAt;
  final int totalStudySeconds;
  final DateTime? lastActivityAt;
}
