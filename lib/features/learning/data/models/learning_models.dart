import 'package:isar/isar.dart';

part 'learning_models.g.dart';

@collection
class Subject {
  Id id = Isar.autoIncrement;
  late String title;
  String description = '';
}

@collection
class Chapter {
  Id id = Isar.autoIncrement;
  late int subjectId;
  late String title;
  String description = '';
  int order = 0;
}

@collection
class LearningUnit {
  Id id = Isar.autoIncrement;
  late int chapterId;
  late String title;
  int order = 0;
  List<ContentBlock> content = [];
}

@embedded
class ContentBlock {
  String type = 'text';
  String text = '';
  int order = 0;
}

@collection
class KnowledgeCheck {
  Id id = Isar.autoIncrement;
  late int learningUnitId;
  late String question;
  List<String> options = [];
  int correctOptionIndex = 0;
  String explanation = '';
}
