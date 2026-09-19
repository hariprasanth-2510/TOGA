import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../database/app_database.dart' as db;
import '../models/learning_models.dart';

class LearningRepository {
  LearningRepository(this._database);

  final db.AppDatabase _database;

  Future<List<Subject>> getSubjects() async {
    final rows = await _database.select(_database.subjects).get();
    return rows.map((row) => Subject(
      id: row.id,
      title: row.title,
      description: row.description,
    )).toList();
  }

  Future<List<Chapter>> getChapters(int subjectId) async {
    final query = _database.select(_database.chapters)
      ..where((row) => row.subjectId.equals(subjectId))
      ..orderBy([(row) => OrderingTerm.asc(row.sortOrder)]);
    final rows = await query.get();
    return rows.map((row) => Chapter(
      id: row.id,
      subjectId: row.subjectId,
      title: row.title,
      description: row.description,
      sortOrder: row.sortOrder,
    )).toList();
  }

  Future<List<LearningUnit>> getLearningUnits(int chapterId) async {
    final query = _database.select(_database.learningUnits)
      ..where((row) => row.chapterId.equals(chapterId))
      ..orderBy([(row) => OrderingTerm.asc(row.sortOrder)]);
    final rows = await query.get();
    return rows.map((row) => LearningUnit(
      id: row.id,
      chapterId: row.chapterId,
      title: row.title,
      summary: row.summary,
      sortOrder: row.sortOrder,
    )).toList();
  }

  Future<List<ContentBlock>> getContentBlocks(int learningUnitId) async {
    final query = _database.select(_database.contentBlocks)
      ..where((row) => row.learningUnitId.equals(learningUnitId))
      ..orderBy([(row) => OrderingTerm.asc(row.sortOrder)]);
    final rows = await query.get();
    return rows.map((row) => ContentBlock(
      id: row.id,
      learningUnitId: row.learningUnitId,
      blockType: row.blockType,
      contentText: row.contentText,
      sortOrder: row.sortOrder,
    )).toList();
  }

  Future<List<KnowledgeCheck>> getKnowledgeChecks(int learningUnitId) async {
    final query = _database.select(_database.knowledgeChecks)
      ..where((row) => row.learningUnitId.equals(learningUnitId));
    final rows = await query.get();
    return rows.map((row) => KnowledgeCheck(
      id: row.id,
      learningUnitId: row.learningUnitId,
      question: row.question,
      options: (jsonDecode(row.optionsJson) as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      correctOptionIndex: row.correctOptionIndex,
      explanation: row.explanation,
    )).toList();
  }
}
