// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, title, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(Insertable<Subject> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int id;
  final String title;
  final String? description;
  const Subject({required this.id, required this.title, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Subject.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
    };
  }

  Subject copyWith(
          {int? id,
          String? title,
          Value<String?> description = const Value.absent()}) =>
      Subject(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
      );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> description;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.description = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
    });
  }

  SubjectsCompanion copyWith(
      {Value<int>? id, Value<String>? title, Value<String?>? description}) {
    return SubjectsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $ChaptersTable extends Chapters with TableInfo<$ChaptersTable, Chapter> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChaptersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, subjectId, title, description, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chapters';
  @override
  VerificationContext validateIntegrity(Insertable<Chapter> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chapter map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chapter(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
    );
  }

  @override
  $ChaptersTable createAlias(String alias) {
    return $ChaptersTable(attachedDatabase, alias);
  }
}

class Chapter extends DataClass implements Insertable<Chapter> {
  final int id;
  final int subjectId;
  final String title;
  final String? description;
  final int sortOrder;
  const Chapter(
      {required this.id,
      required this.subjectId,
      required this.title,
      this.description,
      required this.sortOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_id'] = Variable<int>(subjectId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ChaptersCompanion toCompanion(bool nullToAbsent) {
    return ChaptersCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sortOrder: Value(sortOrder),
    );
  }

  factory Chapter.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chapter(
      id: serializer.fromJson<int>(json['id']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectId': serializer.toJson<int>(subjectId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  Chapter copyWith(
          {int? id,
          int? subjectId,
          String? title,
          Value<String?> description = const Value.absent(),
          int? sortOrder}) =>
      Chapter(
        id: id ?? this.id,
        subjectId: subjectId ?? this.subjectId,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  Chapter copyWithCompanion(ChaptersCompanion data) {
    return Chapter(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Chapter(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, subjectId, title, description, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chapter &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.title == this.title &&
          other.description == this.description &&
          other.sortOrder == this.sortOrder);
}

class ChaptersCompanion extends UpdateCompanion<Chapter> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> sortOrder;
  const ChaptersCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  ChaptersCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    required String title,
    this.description = const Value.absent(),
    this.sortOrder = const Value.absent(),
  })  : subjectId = Value(subjectId),
        title = Value(title);
  static Insertable<Chapter> custom({
    Expression<int>? id,
    Expression<int>? subjectId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  ChaptersCompanion copyWith(
      {Value<int>? id,
      Value<int>? subjectId,
      Value<String>? title,
      Value<String?>? description,
      Value<int>? sortOrder}) {
    return ChaptersCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      title: title ?? this.title,
      description: description ?? this.description,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChaptersCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $LearningUnitsTable extends LearningUnits
    with TableInfo<$LearningUnitsTable, LearningUnit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningUnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, chapterId, title, summary, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_units';
  @override
  VerificationContext validateIntegrity(Insertable<LearningUnit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningUnit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningUnit(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      chapterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary']),
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
    );
  }

  @override
  $LearningUnitsTable createAlias(String alias) {
    return $LearningUnitsTable(attachedDatabase, alias);
  }
}

class LearningUnit extends DataClass implements Insertable<LearningUnit> {
  final int id;
  final int chapterId;
  final String title;
  final String? summary;
  final int sortOrder;
  const LearningUnit(
      {required this.id,
      required this.chapterId,
      required this.title,
      this.summary,
      required this.sortOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['chapter_id'] = Variable<int>(chapterId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  LearningUnitsCompanion toCompanion(bool nullToAbsent) {
    return LearningUnitsCompanion(
      id: Value(id),
      chapterId: Value(chapterId),
      title: Value(title),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      sortOrder: Value(sortOrder),
    );
  }

  factory LearningUnit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningUnit(
      id: serializer.fromJson<int>(json['id']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String?>(json['summary']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'chapterId': serializer.toJson<int>(chapterId),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String?>(summary),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  LearningUnit copyWith(
          {int? id,
          int? chapterId,
          String? title,
          Value<String?> summary = const Value.absent(),
          int? sortOrder}) =>
      LearningUnit(
        id: id ?? this.id,
        chapterId: chapterId ?? this.chapterId,
        title: title ?? this.title,
        summary: summary.present ? summary.value : this.summary,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  LearningUnit copyWithCompanion(LearningUnitsCompanion data) {
    return LearningUnit(
      id: data.id.present ? data.id.value : this.id,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningUnit(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, chapterId, title, summary, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningUnit &&
          other.id == this.id &&
          other.chapterId == this.chapterId &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.sortOrder == this.sortOrder);
}

class LearningUnitsCompanion extends UpdateCompanion<LearningUnit> {
  final Value<int> id;
  final Value<int> chapterId;
  final Value<String> title;
  final Value<String?> summary;
  final Value<int> sortOrder;
  const LearningUnitsCompanion({
    this.id = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  LearningUnitsCompanion.insert({
    this.id = const Value.absent(),
    required int chapterId,
    required String title,
    this.summary = const Value.absent(),
    this.sortOrder = const Value.absent(),
  })  : chapterId = Value(chapterId),
        title = Value(title);
  static Insertable<LearningUnit> custom({
    Expression<int>? id,
    Expression<int>? chapterId,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (chapterId != null) 'chapter_id': chapterId,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  LearningUnitsCompanion copyWith(
      {Value<int>? id,
      Value<int>? chapterId,
      Value<String>? title,
      Value<String?>? summary,
      Value<int>? sortOrder}) {
    return LearningUnitsCompanion(
      id: id ?? this.id,
      chapterId: chapterId ?? this.chapterId,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningUnitsCompanion(')
          ..write('id: $id, ')
          ..write('chapterId: $chapterId, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $ContentBlocksTable extends ContentBlocks
    with TableInfo<$ContentBlocksTable, ContentBlock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContentBlocksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _learningUnitIdMeta =
      const VerificationMeta('learningUnitId');
  @override
  late final GeneratedColumn<int> learningUnitId = GeneratedColumn<int>(
      'learning_unit_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _blockTypeMeta =
      const VerificationMeta('blockType');
  @override
  late final GeneratedColumn<String> blockType = GeneratedColumn<String>(
      'block_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentTextMeta =
      const VerificationMeta('contentText');
  @override
  late final GeneratedColumn<String> contentText = GeneratedColumn<String>(
      'content_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, learningUnitId, blockType, contentText, sortOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'content_blocks';
  @override
  VerificationContext validateIntegrity(Insertable<ContentBlock> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('learning_unit_id')) {
      context.handle(
          _learningUnitIdMeta,
          learningUnitId.isAcceptableOrUnknown(
              data['learning_unit_id']!, _learningUnitIdMeta));
    } else if (isInserting) {
      context.missing(_learningUnitIdMeta);
    }
    if (data.containsKey('block_type')) {
      context.handle(_blockTypeMeta,
          blockType.isAcceptableOrUnknown(data['block_type']!, _blockTypeMeta));
    } else if (isInserting) {
      context.missing(_blockTypeMeta);
    }
    if (data.containsKey('content_text')) {
      context.handle(
          _contentTextMeta,
          contentText.isAcceptableOrUnknown(
              data['content_text']!, _contentTextMeta));
    } else if (isInserting) {
      context.missing(_contentTextMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ContentBlock map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContentBlock(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      learningUnitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}learning_unit_id'])!,
      blockType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}block_type'])!,
      contentText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_text'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
    );
  }

  @override
  $ContentBlocksTable createAlias(String alias) {
    return $ContentBlocksTable(attachedDatabase, alias);
  }
}

class ContentBlock extends DataClass implements Insertable<ContentBlock> {
  final int id;
  final int learningUnitId;
  final String blockType;
  final String contentText;
  final int sortOrder;
  const ContentBlock(
      {required this.id,
      required this.learningUnitId,
      required this.blockType,
      required this.contentText,
      required this.sortOrder});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['learning_unit_id'] = Variable<int>(learningUnitId);
    map['block_type'] = Variable<String>(blockType);
    map['content_text'] = Variable<String>(contentText);
    map['sort_order'] = Variable<int>(sortOrder);
    return map;
  }

  ContentBlocksCompanion toCompanion(bool nullToAbsent) {
    return ContentBlocksCompanion(
      id: Value(id),
      learningUnitId: Value(learningUnitId),
      blockType: Value(blockType),
      contentText: Value(contentText),
      sortOrder: Value(sortOrder),
    );
  }

  factory ContentBlock.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContentBlock(
      id: serializer.fromJson<int>(json['id']),
      learningUnitId: serializer.fromJson<int>(json['learningUnitId']),
      blockType: serializer.fromJson<String>(json['blockType']),
      contentText: serializer.fromJson<String>(json['contentText']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'learningUnitId': serializer.toJson<int>(learningUnitId),
      'blockType': serializer.toJson<String>(blockType),
      'contentText': serializer.toJson<String>(contentText),
      'sortOrder': serializer.toJson<int>(sortOrder),
    };
  }

  ContentBlock copyWith(
          {int? id,
          int? learningUnitId,
          String? blockType,
          String? contentText,
          int? sortOrder}) =>
      ContentBlock(
        id: id ?? this.id,
        learningUnitId: learningUnitId ?? this.learningUnitId,
        blockType: blockType ?? this.blockType,
        contentText: contentText ?? this.contentText,
        sortOrder: sortOrder ?? this.sortOrder,
      );
  ContentBlock copyWithCompanion(ContentBlocksCompanion data) {
    return ContentBlock(
      id: data.id.present ? data.id.value : this.id,
      learningUnitId: data.learningUnitId.present
          ? data.learningUnitId.value
          : this.learningUnitId,
      blockType: data.blockType.present ? data.blockType.value : this.blockType,
      contentText:
          data.contentText.present ? data.contentText.value : this.contentText,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContentBlock(')
          ..write('id: $id, ')
          ..write('learningUnitId: $learningUnitId, ')
          ..write('blockType: $blockType, ')
          ..write('contentText: $contentText, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, learningUnitId, blockType, contentText, sortOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContentBlock &&
          other.id == this.id &&
          other.learningUnitId == this.learningUnitId &&
          other.blockType == this.blockType &&
          other.contentText == this.contentText &&
          other.sortOrder == this.sortOrder);
}

class ContentBlocksCompanion extends UpdateCompanion<ContentBlock> {
  final Value<int> id;
  final Value<int> learningUnitId;
  final Value<String> blockType;
  final Value<String> contentText;
  final Value<int> sortOrder;
  const ContentBlocksCompanion({
    this.id = const Value.absent(),
    this.learningUnitId = const Value.absent(),
    this.blockType = const Value.absent(),
    this.contentText = const Value.absent(),
    this.sortOrder = const Value.absent(),
  });
  ContentBlocksCompanion.insert({
    this.id = const Value.absent(),
    required int learningUnitId,
    required String blockType,
    required String contentText,
    this.sortOrder = const Value.absent(),
  })  : learningUnitId = Value(learningUnitId),
        blockType = Value(blockType),
        contentText = Value(contentText);
  static Insertable<ContentBlock> custom({
    Expression<int>? id,
    Expression<int>? learningUnitId,
    Expression<String>? blockType,
    Expression<String>? contentText,
    Expression<int>? sortOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (learningUnitId != null) 'learning_unit_id': learningUnitId,
      if (blockType != null) 'block_type': blockType,
      if (contentText != null) 'content_text': contentText,
      if (sortOrder != null) 'sort_order': sortOrder,
    });
  }

  ContentBlocksCompanion copyWith(
      {Value<int>? id,
      Value<int>? learningUnitId,
      Value<String>? blockType,
      Value<String>? contentText,
      Value<int>? sortOrder}) {
    return ContentBlocksCompanion(
      id: id ?? this.id,
      learningUnitId: learningUnitId ?? this.learningUnitId,
      blockType: blockType ?? this.blockType,
      contentText: contentText ?? this.contentText,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (learningUnitId.present) {
      map['learning_unit_id'] = Variable<int>(learningUnitId.value);
    }
    if (blockType.present) {
      map['block_type'] = Variable<String>(blockType.value);
    }
    if (contentText.present) {
      map['content_text'] = Variable<String>(contentText.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContentBlocksCompanion(')
          ..write('id: $id, ')
          ..write('learningUnitId: $learningUnitId, ')
          ..write('blockType: $blockType, ')
          ..write('contentText: $contentText, ')
          ..write('sortOrder: $sortOrder')
          ..write(')'))
        .toString();
  }
}

class $KnowledgeChecksTable extends KnowledgeChecks
    with TableInfo<$KnowledgeChecksTable, KnowledgeCheck> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KnowledgeChecksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _learningUnitIdMeta =
      const VerificationMeta('learningUnitId');
  @override
  late final GeneratedColumn<int> learningUnitId = GeneratedColumn<int>(
      'learning_unit_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionsJsonMeta =
      const VerificationMeta('optionsJson');
  @override
  late final GeneratedColumn<String> optionsJson = GeneratedColumn<String>(
      'options_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _correctOptionIndexMeta =
      const VerificationMeta('correctOptionIndex');
  @override
  late final GeneratedColumn<int> correctOptionIndex = GeneratedColumn<int>(
      'correct_option_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _explanationMeta =
      const VerificationMeta('explanation');
  @override
  late final GeneratedColumn<String> explanation = GeneratedColumn<String>(
      'explanation', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        learningUnitId,
        question,
        optionsJson,
        correctOptionIndex,
        explanation
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'knowledge_checks';
  @override
  VerificationContext validateIntegrity(Insertable<KnowledgeCheck> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('learning_unit_id')) {
      context.handle(
          _learningUnitIdMeta,
          learningUnitId.isAcceptableOrUnknown(
              data['learning_unit_id']!, _learningUnitIdMeta));
    } else if (isInserting) {
      context.missing(_learningUnitIdMeta);
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('options_json')) {
      context.handle(
          _optionsJsonMeta,
          optionsJson.isAcceptableOrUnknown(
              data['options_json']!, _optionsJsonMeta));
    } else if (isInserting) {
      context.missing(_optionsJsonMeta);
    }
    if (data.containsKey('correct_option_index')) {
      context.handle(
          _correctOptionIndexMeta,
          correctOptionIndex.isAcceptableOrUnknown(
              data['correct_option_index']!, _correctOptionIndexMeta));
    } else if (isInserting) {
      context.missing(_correctOptionIndexMeta);
    }
    if (data.containsKey('explanation')) {
      context.handle(
          _explanationMeta,
          explanation.isAcceptableOrUnknown(
              data['explanation']!, _explanationMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  KnowledgeCheck map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KnowledgeCheck(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      learningUnitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}learning_unit_id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      optionsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}options_json'])!,
      correctOptionIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}correct_option_index'])!,
      explanation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}explanation']),
    );
  }

  @override
  $KnowledgeChecksTable createAlias(String alias) {
    return $KnowledgeChecksTable(attachedDatabase, alias);
  }
}

class KnowledgeCheck extends DataClass implements Insertable<KnowledgeCheck> {
  final int id;
  final int learningUnitId;
  final String question;
  final String optionsJson;
  final int correctOptionIndex;
  final String? explanation;
  const KnowledgeCheck(
      {required this.id,
      required this.learningUnitId,
      required this.question,
      required this.optionsJson,
      required this.correctOptionIndex,
      this.explanation});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['learning_unit_id'] = Variable<int>(learningUnitId);
    map['question'] = Variable<String>(question);
    map['options_json'] = Variable<String>(optionsJson);
    map['correct_option_index'] = Variable<int>(correctOptionIndex);
    if (!nullToAbsent || explanation != null) {
      map['explanation'] = Variable<String>(explanation);
    }
    return map;
  }

  KnowledgeChecksCompanion toCompanion(bool nullToAbsent) {
    return KnowledgeChecksCompanion(
      id: Value(id),
      learningUnitId: Value(learningUnitId),
      question: Value(question),
      optionsJson: Value(optionsJson),
      correctOptionIndex: Value(correctOptionIndex),
      explanation: explanation == null && nullToAbsent
          ? const Value.absent()
          : Value(explanation),
    );
  }

  factory KnowledgeCheck.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KnowledgeCheck(
      id: serializer.fromJson<int>(json['id']),
      learningUnitId: serializer.fromJson<int>(json['learningUnitId']),
      question: serializer.fromJson<String>(json['question']),
      optionsJson: serializer.fromJson<String>(json['optionsJson']),
      correctOptionIndex: serializer.fromJson<int>(json['correctOptionIndex']),
      explanation: serializer.fromJson<String?>(json['explanation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'learningUnitId': serializer.toJson<int>(learningUnitId),
      'question': serializer.toJson<String>(question),
      'optionsJson': serializer.toJson<String>(optionsJson),
      'correctOptionIndex': serializer.toJson<int>(correctOptionIndex),
      'explanation': serializer.toJson<String?>(explanation),
    };
  }

  KnowledgeCheck copyWith(
          {int? id,
          int? learningUnitId,
          String? question,
          String? optionsJson,
          int? correctOptionIndex,
          Value<String?> explanation = const Value.absent()}) =>
      KnowledgeCheck(
        id: id ?? this.id,
        learningUnitId: learningUnitId ?? this.learningUnitId,
        question: question ?? this.question,
        optionsJson: optionsJson ?? this.optionsJson,
        correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
        explanation: explanation.present ? explanation.value : this.explanation,
      );
  KnowledgeCheck copyWithCompanion(KnowledgeChecksCompanion data) {
    return KnowledgeCheck(
      id: data.id.present ? data.id.value : this.id,
      learningUnitId: data.learningUnitId.present
          ? data.learningUnitId.value
          : this.learningUnitId,
      question: data.question.present ? data.question.value : this.question,
      optionsJson:
          data.optionsJson.present ? data.optionsJson.value : this.optionsJson,
      correctOptionIndex: data.correctOptionIndex.present
          ? data.correctOptionIndex.value
          : this.correctOptionIndex,
      explanation:
          data.explanation.present ? data.explanation.value : this.explanation,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeCheck(')
          ..write('id: $id, ')
          ..write('learningUnitId: $learningUnitId, ')
          ..write('question: $question, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('correctOptionIndex: $correctOptionIndex, ')
          ..write('explanation: $explanation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, learningUnitId, question, optionsJson,
      correctOptionIndex, explanation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KnowledgeCheck &&
          other.id == this.id &&
          other.learningUnitId == this.learningUnitId &&
          other.question == this.question &&
          other.optionsJson == this.optionsJson &&
          other.correctOptionIndex == this.correctOptionIndex &&
          other.explanation == this.explanation);
}

class KnowledgeChecksCompanion extends UpdateCompanion<KnowledgeCheck> {
  final Value<int> id;
  final Value<int> learningUnitId;
  final Value<String> question;
  final Value<String> optionsJson;
  final Value<int> correctOptionIndex;
  final Value<String?> explanation;
  const KnowledgeChecksCompanion({
    this.id = const Value.absent(),
    this.learningUnitId = const Value.absent(),
    this.question = const Value.absent(),
    this.optionsJson = const Value.absent(),
    this.correctOptionIndex = const Value.absent(),
    this.explanation = const Value.absent(),
  });
  KnowledgeChecksCompanion.insert({
    this.id = const Value.absent(),
    required int learningUnitId,
    required String question,
    required String optionsJson,
    required int correctOptionIndex,
    this.explanation = const Value.absent(),
  })  : learningUnitId = Value(learningUnitId),
        question = Value(question),
        optionsJson = Value(optionsJson),
        correctOptionIndex = Value(correctOptionIndex);
  static Insertable<KnowledgeCheck> custom({
    Expression<int>? id,
    Expression<int>? learningUnitId,
    Expression<String>? question,
    Expression<String>? optionsJson,
    Expression<int>? correctOptionIndex,
    Expression<String>? explanation,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (learningUnitId != null) 'learning_unit_id': learningUnitId,
      if (question != null) 'question': question,
      if (optionsJson != null) 'options_json': optionsJson,
      if (correctOptionIndex != null)
        'correct_option_index': correctOptionIndex,
      if (explanation != null) 'explanation': explanation,
    });
  }

  KnowledgeChecksCompanion copyWith(
      {Value<int>? id,
      Value<int>? learningUnitId,
      Value<String>? question,
      Value<String>? optionsJson,
      Value<int>? correctOptionIndex,
      Value<String?>? explanation}) {
    return KnowledgeChecksCompanion(
      id: id ?? this.id,
      learningUnitId: learningUnitId ?? this.learningUnitId,
      question: question ?? this.question,
      optionsJson: optionsJson ?? this.optionsJson,
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      explanation: explanation ?? this.explanation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (learningUnitId.present) {
      map['learning_unit_id'] = Variable<int>(learningUnitId.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (optionsJson.present) {
      map['options_json'] = Variable<String>(optionsJson.value);
    }
    if (correctOptionIndex.present) {
      map['correct_option_index'] = Variable<int>(correctOptionIndex.value);
    }
    if (explanation.present) {
      map['explanation'] = Variable<String>(explanation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeChecksCompanion(')
          ..write('id: $id, ')
          ..write('learningUnitId: $learningUnitId, ')
          ..write('question: $question, ')
          ..write('optionsJson: $optionsJson, ')
          ..write('correctOptionIndex: $correctOptionIndex, ')
          ..write('explanation: $explanation')
          ..write(')'))
        .toString();
  }
}

class $LearningSessionsTable extends LearningSessions
    with TableInfo<$LearningSessionsTable, LearningSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LearningSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _subjectIdMeta =
      const VerificationMeta('subjectId');
  @override
  late final GeneratedColumn<int> subjectId = GeneratedColumn<int>(
      'subject_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _chapterIdMeta =
      const VerificationMeta('chapterId');
  @override
  late final GeneratedColumn<int> chapterId = GeneratedColumn<int>(
      'chapter_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _learningUnitIdMeta =
      const VerificationMeta('learningUnitId');
  @override
  late final GeneratedColumn<int> learningUnitId = GeneratedColumn<int>(
      'learning_unit_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scrollPositionMeta =
      const VerificationMeta('scrollPosition');
  @override
  late final GeneratedColumn<double> scrollPosition = GeneratedColumn<double>(
      'scroll_position', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
      'progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _sessionStartedAtMeta =
      const VerificationMeta('sessionStartedAt');
  @override
  late final GeneratedColumn<DateTime> sessionStartedAt =
      GeneratedColumn<DateTime>('session_started_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _totalStudySecondsMeta =
      const VerificationMeta('totalStudySeconds');
  @override
  late final GeneratedColumn<int> totalStudySeconds = GeneratedColumn<int>(
      'total_study_seconds', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastActivityAtMeta =
      const VerificationMeta('lastActivityAt');
  @override
  late final GeneratedColumn<DateTime> lastActivityAt =
      GeneratedColumn<DateTime>('last_activity_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        subjectId,
        chapterId,
        learningUnitId,
        scrollPosition,
        completed,
        progress,
        sessionStartedAt,
        totalStudySeconds,
        lastActivityAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'learning_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<LearningSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id']!, _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('chapter_id')) {
      context.handle(_chapterIdMeta,
          chapterId.isAcceptableOrUnknown(data['chapter_id']!, _chapterIdMeta));
    } else if (isInserting) {
      context.missing(_chapterIdMeta);
    }
    if (data.containsKey('learning_unit_id')) {
      context.handle(
          _learningUnitIdMeta,
          learningUnitId.isAcceptableOrUnknown(
              data['learning_unit_id']!, _learningUnitIdMeta));
    } else if (isInserting) {
      context.missing(_learningUnitIdMeta);
    }
    if (data.containsKey('scroll_position')) {
      context.handle(
          _scrollPositionMeta,
          scrollPosition.isAcceptableOrUnknown(
              data['scroll_position']!, _scrollPositionMeta));
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    if (data.containsKey('progress')) {
      context.handle(_progressMeta,
          progress.isAcceptableOrUnknown(data['progress']!, _progressMeta));
    }
    if (data.containsKey('session_started_at')) {
      context.handle(
          _sessionStartedAtMeta,
          sessionStartedAt.isAcceptableOrUnknown(
              data['session_started_at']!, _sessionStartedAtMeta));
    }
    if (data.containsKey('total_study_seconds')) {
      context.handle(
          _totalStudySecondsMeta,
          totalStudySeconds.isAcceptableOrUnknown(
              data['total_study_seconds']!, _totalStudySecondsMeta));
    }
    if (data.containsKey('last_activity_at')) {
      context.handle(
          _lastActivityAtMeta,
          lastActivityAt.isAcceptableOrUnknown(
              data['last_activity_at']!, _lastActivityAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LearningSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LearningSession(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      subjectId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}subject_id'])!,
      chapterId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}chapter_id'])!,
      learningUnitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}learning_unit_id'])!,
      scrollPosition: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}scroll_position'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
      progress: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}progress'])!,
      sessionStartedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}session_started_at']),
      totalStudySeconds: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_study_seconds'])!,
      lastActivityAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_activity_at']),
    );
  }

  @override
  $LearningSessionsTable createAlias(String alias) {
    return $LearningSessionsTable(attachedDatabase, alias);
  }
}

class LearningSession extends DataClass implements Insertable<LearningSession> {
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
  const LearningSession(
      {required this.id,
      required this.subjectId,
      required this.chapterId,
      required this.learningUnitId,
      required this.scrollPosition,
      required this.completed,
      required this.progress,
      this.sessionStartedAt,
      required this.totalStudySeconds,
      this.lastActivityAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_id'] = Variable<int>(subjectId);
    map['chapter_id'] = Variable<int>(chapterId);
    map['learning_unit_id'] = Variable<int>(learningUnitId);
    map['scroll_position'] = Variable<double>(scrollPosition);
    map['completed'] = Variable<bool>(completed);
    map['progress'] = Variable<double>(progress);
    if (!nullToAbsent || sessionStartedAt != null) {
      map['session_started_at'] = Variable<DateTime>(sessionStartedAt);
    }
    map['total_study_seconds'] = Variable<int>(totalStudySeconds);
    if (!nullToAbsent || lastActivityAt != null) {
      map['last_activity_at'] = Variable<DateTime>(lastActivityAt);
    }
    return map;
  }

  LearningSessionsCompanion toCompanion(bool nullToAbsent) {
    return LearningSessionsCompanion(
      id: Value(id),
      subjectId: Value(subjectId),
      chapterId: Value(chapterId),
      learningUnitId: Value(learningUnitId),
      scrollPosition: Value(scrollPosition),
      completed: Value(completed),
      progress: Value(progress),
      sessionStartedAt: sessionStartedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionStartedAt),
      totalStudySeconds: Value(totalStudySeconds),
      lastActivityAt: lastActivityAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastActivityAt),
    );
  }

  factory LearningSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LearningSession(
      id: serializer.fromJson<int>(json['id']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      chapterId: serializer.fromJson<int>(json['chapterId']),
      learningUnitId: serializer.fromJson<int>(json['learningUnitId']),
      scrollPosition: serializer.fromJson<double>(json['scrollPosition']),
      completed: serializer.fromJson<bool>(json['completed']),
      progress: serializer.fromJson<double>(json['progress']),
      sessionStartedAt:
          serializer.fromJson<DateTime?>(json['sessionStartedAt']),
      totalStudySeconds: serializer.fromJson<int>(json['totalStudySeconds']),
      lastActivityAt: serializer.fromJson<DateTime?>(json['lastActivityAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectId': serializer.toJson<int>(subjectId),
      'chapterId': serializer.toJson<int>(chapterId),
      'learningUnitId': serializer.toJson<int>(learningUnitId),
      'scrollPosition': serializer.toJson<double>(scrollPosition),
      'completed': serializer.toJson<bool>(completed),
      'progress': serializer.toJson<double>(progress),
      'sessionStartedAt': serializer.toJson<DateTime?>(sessionStartedAt),
      'totalStudySeconds': serializer.toJson<int>(totalStudySeconds),
      'lastActivityAt': serializer.toJson<DateTime?>(lastActivityAt),
    };
  }

  LearningSession copyWith(
          {int? id,
          int? subjectId,
          int? chapterId,
          int? learningUnitId,
          double? scrollPosition,
          bool? completed,
          double? progress,
          Value<DateTime?> sessionStartedAt = const Value.absent(),
          int? totalStudySeconds,
          Value<DateTime?> lastActivityAt = const Value.absent()}) =>
      LearningSession(
        id: id ?? this.id,
        subjectId: subjectId ?? this.subjectId,
        chapterId: chapterId ?? this.chapterId,
        learningUnitId: learningUnitId ?? this.learningUnitId,
        scrollPosition: scrollPosition ?? this.scrollPosition,
        completed: completed ?? this.completed,
        progress: progress ?? this.progress,
        sessionStartedAt: sessionStartedAt.present
            ? sessionStartedAt.value
            : this.sessionStartedAt,
        totalStudySeconds: totalStudySeconds ?? this.totalStudySeconds,
        lastActivityAt:
            lastActivityAt.present ? lastActivityAt.value : this.lastActivityAt,
      );
  LearningSession copyWithCompanion(LearningSessionsCompanion data) {
    return LearningSession(
      id: data.id.present ? data.id.value : this.id,
      subjectId: data.subjectId.present ? data.subjectId.value : this.subjectId,
      chapterId: data.chapterId.present ? data.chapterId.value : this.chapterId,
      learningUnitId: data.learningUnitId.present
          ? data.learningUnitId.value
          : this.learningUnitId,
      scrollPosition: data.scrollPosition.present
          ? data.scrollPosition.value
          : this.scrollPosition,
      completed: data.completed.present ? data.completed.value : this.completed,
      progress: data.progress.present ? data.progress.value : this.progress,
      sessionStartedAt: data.sessionStartedAt.present
          ? data.sessionStartedAt.value
          : this.sessionStartedAt,
      totalStudySeconds: data.totalStudySeconds.present
          ? data.totalStudySeconds.value
          : this.totalStudySeconds,
      lastActivityAt: data.lastActivityAt.present
          ? data.lastActivityAt.value
          : this.lastActivityAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LearningSession(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('chapterId: $chapterId, ')
          ..write('learningUnitId: $learningUnitId, ')
          ..write('scrollPosition: $scrollPosition, ')
          ..write('completed: $completed, ')
          ..write('progress: $progress, ')
          ..write('sessionStartedAt: $sessionStartedAt, ')
          ..write('totalStudySeconds: $totalStudySeconds, ')
          ..write('lastActivityAt: $lastActivityAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      subjectId,
      chapterId,
      learningUnitId,
      scrollPosition,
      completed,
      progress,
      sessionStartedAt,
      totalStudySeconds,
      lastActivityAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LearningSession &&
          other.id == this.id &&
          other.subjectId == this.subjectId &&
          other.chapterId == this.chapterId &&
          other.learningUnitId == this.learningUnitId &&
          other.scrollPosition == this.scrollPosition &&
          other.completed == this.completed &&
          other.progress == this.progress &&
          other.sessionStartedAt == this.sessionStartedAt &&
          other.totalStudySeconds == this.totalStudySeconds &&
          other.lastActivityAt == this.lastActivityAt);
}

class LearningSessionsCompanion extends UpdateCompanion<LearningSession> {
  final Value<int> id;
  final Value<int> subjectId;
  final Value<int> chapterId;
  final Value<int> learningUnitId;
  final Value<double> scrollPosition;
  final Value<bool> completed;
  final Value<double> progress;
  final Value<DateTime?> sessionStartedAt;
  final Value<int> totalStudySeconds;
  final Value<DateTime?> lastActivityAt;
  const LearningSessionsCompanion({
    this.id = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.chapterId = const Value.absent(),
    this.learningUnitId = const Value.absent(),
    this.scrollPosition = const Value.absent(),
    this.completed = const Value.absent(),
    this.progress = const Value.absent(),
    this.sessionStartedAt = const Value.absent(),
    this.totalStudySeconds = const Value.absent(),
    this.lastActivityAt = const Value.absent(),
  });
  LearningSessionsCompanion.insert({
    this.id = const Value.absent(),
    required int subjectId,
    required int chapterId,
    required int learningUnitId,
    this.scrollPosition = const Value.absent(),
    this.completed = const Value.absent(),
    this.progress = const Value.absent(),
    this.sessionStartedAt = const Value.absent(),
    this.totalStudySeconds = const Value.absent(),
    this.lastActivityAt = const Value.absent(),
  })  : subjectId = Value(subjectId),
        chapterId = Value(chapterId),
        learningUnitId = Value(learningUnitId);
  static Insertable<LearningSession> custom({
    Expression<int>? id,
    Expression<int>? subjectId,
    Expression<int>? chapterId,
    Expression<int>? learningUnitId,
    Expression<double>? scrollPosition,
    Expression<bool>? completed,
    Expression<double>? progress,
    Expression<DateTime>? sessionStartedAt,
    Expression<int>? totalStudySeconds,
    Expression<DateTime>? lastActivityAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectId != null) 'subject_id': subjectId,
      if (chapterId != null) 'chapter_id': chapterId,
      if (learningUnitId != null) 'learning_unit_id': learningUnitId,
      if (scrollPosition != null) 'scroll_position': scrollPosition,
      if (completed != null) 'completed': completed,
      if (progress != null) 'progress': progress,
      if (sessionStartedAt != null) 'session_started_at': sessionStartedAt,
      if (totalStudySeconds != null) 'total_study_seconds': totalStudySeconds,
      if (lastActivityAt != null) 'last_activity_at': lastActivityAt,
    });
  }

  LearningSessionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? subjectId,
      Value<int>? chapterId,
      Value<int>? learningUnitId,
      Value<double>? scrollPosition,
      Value<bool>? completed,
      Value<double>? progress,
      Value<DateTime?>? sessionStartedAt,
      Value<int>? totalStudySeconds,
      Value<DateTime?>? lastActivityAt}) {
    return LearningSessionsCompanion(
      id: id ?? this.id,
      subjectId: subjectId ?? this.subjectId,
      chapterId: chapterId ?? this.chapterId,
      learningUnitId: learningUnitId ?? this.learningUnitId,
      scrollPosition: scrollPosition ?? this.scrollPosition,
      completed: completed ?? this.completed,
      progress: progress ?? this.progress,
      sessionStartedAt: sessionStartedAt ?? this.sessionStartedAt,
      totalStudySeconds: totalStudySeconds ?? this.totalStudySeconds,
      lastActivityAt: lastActivityAt ?? this.lastActivityAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (chapterId.present) {
      map['chapter_id'] = Variable<int>(chapterId.value);
    }
    if (learningUnitId.present) {
      map['learning_unit_id'] = Variable<int>(learningUnitId.value);
    }
    if (scrollPosition.present) {
      map['scroll_position'] = Variable<double>(scrollPosition.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (sessionStartedAt.present) {
      map['session_started_at'] = Variable<DateTime>(sessionStartedAt.value);
    }
    if (totalStudySeconds.present) {
      map['total_study_seconds'] = Variable<int>(totalStudySeconds.value);
    }
    if (lastActivityAt.present) {
      map['last_activity_at'] = Variable<DateTime>(lastActivityAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LearningSessionsCompanion(')
          ..write('id: $id, ')
          ..write('subjectId: $subjectId, ')
          ..write('chapterId: $chapterId, ')
          ..write('learningUnitId: $learningUnitId, ')
          ..write('scrollPosition: $scrollPosition, ')
          ..write('completed: $completed, ')
          ..write('progress: $progress, ')
          ..write('sessionStartedAt: $sessionStartedAt, ')
          ..write('totalStudySeconds: $totalStudySeconds, ')
          ..write('lastActivityAt: $lastActivityAt')
          ..write(')'))
        .toString();
  }
}

class $UnitPersonalDataTable extends UnitPersonalData
    with TableInfo<$UnitPersonalDataTable, UnitPersonalDataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitPersonalDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _learningUnitIdMeta =
      const VerificationMeta('learningUnitId');
  @override
  late final GeneratedColumn<int> learningUnitId = GeneratedColumn<int>(
      'learning_unit_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _bookmarkedMeta =
      const VerificationMeta('bookmarked');
  @override
  late final GeneratedColumn<bool> bookmarked = GeneratedColumn<bool>(
      'bookmarked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("bookmarked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [learningUnitId, bookmarked, note, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'unit_personal_data';
  @override
  VerificationContext validateIntegrity(
      Insertable<UnitPersonalDataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('learning_unit_id')) {
      context.handle(
          _learningUnitIdMeta,
          learningUnitId.isAcceptableOrUnknown(
              data['learning_unit_id']!, _learningUnitIdMeta));
    }
    if (data.containsKey('bookmarked')) {
      context.handle(
          _bookmarkedMeta,
          bookmarked.isAcceptableOrUnknown(
              data['bookmarked']!, _bookmarkedMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {learningUnitId};
  @override
  UnitPersonalDataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UnitPersonalDataData(
      learningUnitId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}learning_unit_id'])!,
      bookmarked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}bookmarked'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UnitPersonalDataTable createAlias(String alias) {
    return $UnitPersonalDataTable(attachedDatabase, alias);
  }
}

class UnitPersonalDataData extends DataClass
    implements Insertable<UnitPersonalDataData> {
  final int learningUnitId;
  final bool bookmarked;
  final String? note;
  final DateTime updatedAt;
  const UnitPersonalDataData(
      {required this.learningUnitId,
      required this.bookmarked,
      this.note,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['learning_unit_id'] = Variable<int>(learningUnitId);
    map['bookmarked'] = Variable<bool>(bookmarked);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UnitPersonalDataCompanion toCompanion(bool nullToAbsent) {
    return UnitPersonalDataCompanion(
      learningUnitId: Value(learningUnitId),
      bookmarked: Value(bookmarked),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      updatedAt: Value(updatedAt),
    );
  }

  factory UnitPersonalDataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UnitPersonalDataData(
      learningUnitId: serializer.fromJson<int>(json['learningUnitId']),
      bookmarked: serializer.fromJson<bool>(json['bookmarked']),
      note: serializer.fromJson<String?>(json['note']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'learningUnitId': serializer.toJson<int>(learningUnitId),
      'bookmarked': serializer.toJson<bool>(bookmarked),
      'note': serializer.toJson<String?>(note),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UnitPersonalDataData copyWith(
          {int? learningUnitId,
          bool? bookmarked,
          Value<String?> note = const Value.absent(),
          DateTime? updatedAt}) =>
      UnitPersonalDataData(
        learningUnitId: learningUnitId ?? this.learningUnitId,
        bookmarked: bookmarked ?? this.bookmarked,
        note: note.present ? note.value : this.note,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UnitPersonalDataData copyWithCompanion(UnitPersonalDataCompanion data) {
    return UnitPersonalDataData(
      learningUnitId: data.learningUnitId.present
          ? data.learningUnitId.value
          : this.learningUnitId,
      bookmarked:
          data.bookmarked.present ? data.bookmarked.value : this.bookmarked,
      note: data.note.present ? data.note.value : this.note,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UnitPersonalDataData(')
          ..write('learningUnitId: $learningUnitId, ')
          ..write('bookmarked: $bookmarked, ')
          ..write('note: $note, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(learningUnitId, bookmarked, note, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UnitPersonalDataData &&
          other.learningUnitId == this.learningUnitId &&
          other.bookmarked == this.bookmarked &&
          other.note == this.note &&
          other.updatedAt == this.updatedAt);
}

class UnitPersonalDataCompanion extends UpdateCompanion<UnitPersonalDataData> {
  final Value<int> learningUnitId;
  final Value<bool> bookmarked;
  final Value<String?> note;
  final Value<DateTime> updatedAt;
  const UnitPersonalDataCompanion({
    this.learningUnitId = const Value.absent(),
    this.bookmarked = const Value.absent(),
    this.note = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  UnitPersonalDataCompanion.insert({
    this.learningUnitId = const Value.absent(),
    this.bookmarked = const Value.absent(),
    this.note = const Value.absent(),
    required DateTime updatedAt,
  }) : updatedAt = Value(updatedAt);
  static Insertable<UnitPersonalDataData> custom({
    Expression<int>? learningUnitId,
    Expression<bool>? bookmarked,
    Expression<String>? note,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (learningUnitId != null) 'learning_unit_id': learningUnitId,
      if (bookmarked != null) 'bookmarked': bookmarked,
      if (note != null) 'note': note,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  UnitPersonalDataCompanion copyWith(
      {Value<int>? learningUnitId,
      Value<bool>? bookmarked,
      Value<String?>? note,
      Value<DateTime>? updatedAt}) {
    return UnitPersonalDataCompanion(
      learningUnitId: learningUnitId ?? this.learningUnitId,
      bookmarked: bookmarked ?? this.bookmarked,
      note: note ?? this.note,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (learningUnitId.present) {
      map['learning_unit_id'] = Variable<int>(learningUnitId.value);
    }
    if (bookmarked.present) {
      map['bookmarked'] = Variable<bool>(bookmarked.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitPersonalDataCompanion(')
          ..write('learningUnitId: $learningUnitId, ')
          ..write('bookmarked: $bookmarked, ')
          ..write('note: $note, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $KnowledgeCheckAttemptsTable extends KnowledgeCheckAttempts
    with TableInfo<$KnowledgeCheckAttemptsTable, KnowledgeCheckAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KnowledgeCheckAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _knowledgeCheckIdMeta =
      const VerificationMeta('knowledgeCheckId');
  @override
  late final GeneratedColumn<int> knowledgeCheckId = GeneratedColumn<int>(
      'knowledge_check_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _selectedOptionIndexMeta =
      const VerificationMeta('selectedOptionIndex');
  @override
  late final GeneratedColumn<int> selectedOptionIndex = GeneratedColumn<int>(
      'selected_option_index', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isCorrectMeta =
      const VerificationMeta('isCorrect');
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
      'is_correct', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_correct" IN (0, 1))'));
  static const VerificationMeta _answeredAtMeta =
      const VerificationMeta('answeredAt');
  @override
  late final GeneratedColumn<DateTime> answeredAt = GeneratedColumn<DateTime>(
      'answered_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [knowledgeCheckId, selectedOptionIndex, isCorrect, answeredAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'knowledge_check_attempts';
  @override
  VerificationContext validateIntegrity(
      Insertable<KnowledgeCheckAttempt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('knowledge_check_id')) {
      context.handle(
          _knowledgeCheckIdMeta,
          knowledgeCheckId.isAcceptableOrUnknown(
              data['knowledge_check_id']!, _knowledgeCheckIdMeta));
    }
    if (data.containsKey('selected_option_index')) {
      context.handle(
          _selectedOptionIndexMeta,
          selectedOptionIndex.isAcceptableOrUnknown(
              data['selected_option_index']!, _selectedOptionIndexMeta));
    } else if (isInserting) {
      context.missing(_selectedOptionIndexMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(_isCorrectMeta,
          isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta));
    } else if (isInserting) {
      context.missing(_isCorrectMeta);
    }
    if (data.containsKey('answered_at')) {
      context.handle(
          _answeredAtMeta,
          answeredAt.isAcceptableOrUnknown(
              data['answered_at']!, _answeredAtMeta));
    } else if (isInserting) {
      context.missing(_answeredAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {knowledgeCheckId};
  @override
  KnowledgeCheckAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KnowledgeCheckAttempt(
      knowledgeCheckId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}knowledge_check_id'])!,
      selectedOptionIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}selected_option_index'])!,
      isCorrect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_correct'])!,
      answeredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}answered_at'])!,
    );
  }

  @override
  $KnowledgeCheckAttemptsTable createAlias(String alias) {
    return $KnowledgeCheckAttemptsTable(attachedDatabase, alias);
  }
}

class KnowledgeCheckAttempt extends DataClass
    implements Insertable<KnowledgeCheckAttempt> {
  final int knowledgeCheckId;
  final int selectedOptionIndex;
  final bool isCorrect;
  final DateTime answeredAt;
  const KnowledgeCheckAttempt(
      {required this.knowledgeCheckId,
      required this.selectedOptionIndex,
      required this.isCorrect,
      required this.answeredAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['knowledge_check_id'] = Variable<int>(knowledgeCheckId);
    map['selected_option_index'] = Variable<int>(selectedOptionIndex);
    map['is_correct'] = Variable<bool>(isCorrect);
    map['answered_at'] = Variable<DateTime>(answeredAt);
    return map;
  }

  KnowledgeCheckAttemptsCompanion toCompanion(bool nullToAbsent) {
    return KnowledgeCheckAttemptsCompanion(
      knowledgeCheckId: Value(knowledgeCheckId),
      selectedOptionIndex: Value(selectedOptionIndex),
      isCorrect: Value(isCorrect),
      answeredAt: Value(answeredAt),
    );
  }

  factory KnowledgeCheckAttempt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KnowledgeCheckAttempt(
      knowledgeCheckId: serializer.fromJson<int>(json['knowledgeCheckId']),
      selectedOptionIndex:
          serializer.fromJson<int>(json['selectedOptionIndex']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
      answeredAt: serializer.fromJson<DateTime>(json['answeredAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'knowledgeCheckId': serializer.toJson<int>(knowledgeCheckId),
      'selectedOptionIndex': serializer.toJson<int>(selectedOptionIndex),
      'isCorrect': serializer.toJson<bool>(isCorrect),
      'answeredAt': serializer.toJson<DateTime>(answeredAt),
    };
  }

  KnowledgeCheckAttempt copyWith(
          {int? knowledgeCheckId,
          int? selectedOptionIndex,
          bool? isCorrect,
          DateTime? answeredAt}) =>
      KnowledgeCheckAttempt(
        knowledgeCheckId: knowledgeCheckId ?? this.knowledgeCheckId,
        selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
        isCorrect: isCorrect ?? this.isCorrect,
        answeredAt: answeredAt ?? this.answeredAt,
      );
  KnowledgeCheckAttempt copyWithCompanion(
      KnowledgeCheckAttemptsCompanion data) {
    return KnowledgeCheckAttempt(
      knowledgeCheckId: data.knowledgeCheckId.present
          ? data.knowledgeCheckId.value
          : this.knowledgeCheckId,
      selectedOptionIndex: data.selectedOptionIndex.present
          ? data.selectedOptionIndex.value
          : this.selectedOptionIndex,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      answeredAt:
          data.answeredAt.present ? data.answeredAt.value : this.answeredAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeCheckAttempt(')
          ..write('knowledgeCheckId: $knowledgeCheckId, ')
          ..write('selectedOptionIndex: $selectedOptionIndex, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(knowledgeCheckId, selectedOptionIndex, isCorrect, answeredAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KnowledgeCheckAttempt &&
          other.knowledgeCheckId == this.knowledgeCheckId &&
          other.selectedOptionIndex == this.selectedOptionIndex &&
          other.isCorrect == this.isCorrect &&
          other.answeredAt == this.answeredAt);
}

class KnowledgeCheckAttemptsCompanion
    extends UpdateCompanion<KnowledgeCheckAttempt> {
  final Value<int> knowledgeCheckId;
  final Value<int> selectedOptionIndex;
  final Value<bool> isCorrect;
  final Value<DateTime> answeredAt;
  const KnowledgeCheckAttemptsCompanion({
    this.knowledgeCheckId = const Value.absent(),
    this.selectedOptionIndex = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.answeredAt = const Value.absent(),
  });
  KnowledgeCheckAttemptsCompanion.insert({
    this.knowledgeCheckId = const Value.absent(),
    required int selectedOptionIndex,
    required bool isCorrect,
    required DateTime answeredAt,
  })  : selectedOptionIndex = Value(selectedOptionIndex),
        isCorrect = Value(isCorrect),
        answeredAt = Value(answeredAt);
  static Insertable<KnowledgeCheckAttempt> custom({
    Expression<int>? knowledgeCheckId,
    Expression<int>? selectedOptionIndex,
    Expression<bool>? isCorrect,
    Expression<DateTime>? answeredAt,
  }) {
    return RawValuesInsertable({
      if (knowledgeCheckId != null) 'knowledge_check_id': knowledgeCheckId,
      if (selectedOptionIndex != null)
        'selected_option_index': selectedOptionIndex,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (answeredAt != null) 'answered_at': answeredAt,
    });
  }

  KnowledgeCheckAttemptsCompanion copyWith(
      {Value<int>? knowledgeCheckId,
      Value<int>? selectedOptionIndex,
      Value<bool>? isCorrect,
      Value<DateTime>? answeredAt}) {
    return KnowledgeCheckAttemptsCompanion(
      knowledgeCheckId: knowledgeCheckId ?? this.knowledgeCheckId,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
      isCorrect: isCorrect ?? this.isCorrect,
      answeredAt: answeredAt ?? this.answeredAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (knowledgeCheckId.present) {
      map['knowledge_check_id'] = Variable<int>(knowledgeCheckId.value);
    }
    if (selectedOptionIndex.present) {
      map['selected_option_index'] = Variable<int>(selectedOptionIndex.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (answeredAt.present) {
      map['answered_at'] = Variable<DateTime>(answeredAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KnowledgeCheckAttemptsCompanion(')
          ..write('knowledgeCheckId: $knowledgeCheckId, ')
          ..write('selectedOptionIndex: $selectedOptionIndex, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('answeredAt: $answeredAt')
          ..write(')'))
        .toString();
  }
}

class $AssessmentAttemptsTable extends AssessmentAttempts
    with TableInfo<$AssessmentAttemptsTable, AssessmentAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentAttemptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
      'started_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deadlineAtMeta =
      const VerificationMeta('deadlineAt');
  @override
  late final GeneratedColumn<DateTime> deadlineAt = GeneratedColumn<DateTime>(
      'deadline_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _submittedAtMeta =
      const VerificationMeta('submittedAt');
  @override
  late final GeneratedColumn<DateTime> submittedAt = GeneratedColumn<DateTime>(
      'submitted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentQuestionIndexMeta =
      const VerificationMeta('currentQuestionIndex');
  @override
  late final GeneratedColumn<int> currentQuestionIndex = GeneratedColumn<int>(
      'current_question_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _questionOrderJsonMeta =
      const VerificationMeta('questionOrderJson');
  @override
  late final GeneratedColumn<String> questionOrderJson =
      GeneratedColumn<String>('question_order_json', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionOrderJsonMeta =
      const VerificationMeta('optionOrderJson');
  @override
  late final GeneratedColumn<String> optionOrderJson = GeneratedColumn<String>(
      'option_order_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _flaggedQuestionIdsJsonMeta =
      const VerificationMeta('flaggedQuestionIdsJson');
  @override
  late final GeneratedColumn<String> flaggedQuestionIdsJson =
      GeneratedColumn<String>('flagged_question_ids_json', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('[]'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        startedAt,
        deadlineAt,
        submittedAt,
        status,
        currentQuestionIndex,
        questionOrderJson,
        optionOrderJson,
        flaggedQuestionIdsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_attempts';
  @override
  VerificationContext validateIntegrity(Insertable<AssessmentAttempt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('deadline_at')) {
      context.handle(
          _deadlineAtMeta,
          deadlineAt.isAcceptableOrUnknown(
              data['deadline_at']!, _deadlineAtMeta));
    } else if (isInserting) {
      context.missing(_deadlineAtMeta);
    }
    if (data.containsKey('submitted_at')) {
      context.handle(
          _submittedAtMeta,
          submittedAt.isAcceptableOrUnknown(
              data['submitted_at']!, _submittedAtMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('current_question_index')) {
      context.handle(
          _currentQuestionIndexMeta,
          currentQuestionIndex.isAcceptableOrUnknown(
              data['current_question_index']!, _currentQuestionIndexMeta));
    }
    if (data.containsKey('question_order_json')) {
      context.handle(
          _questionOrderJsonMeta,
          questionOrderJson.isAcceptableOrUnknown(
              data['question_order_json']!, _questionOrderJsonMeta));
    } else if (isInserting) {
      context.missing(_questionOrderJsonMeta);
    }
    if (data.containsKey('option_order_json')) {
      context.handle(
          _optionOrderJsonMeta,
          optionOrderJson.isAcceptableOrUnknown(
              data['option_order_json']!, _optionOrderJsonMeta));
    }
    if (data.containsKey('flagged_question_ids_json')) {
      context.handle(
          _flaggedQuestionIdsJsonMeta,
          flaggedQuestionIdsJson.isAcceptableOrUnknown(
              data['flagged_question_ids_json']!, _flaggedQuestionIdsJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssessmentAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentAttempt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}started_at'])!,
      deadlineAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline_at'])!,
      submittedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}submitted_at']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      currentQuestionIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}current_question_index'])!,
      questionOrderJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}question_order_json'])!,
      optionOrderJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}option_order_json'])!,
      flaggedQuestionIdsJson: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}flagged_question_ids_json'])!,
    );
  }

  @override
  $AssessmentAttemptsTable createAlias(String alias) {
    return $AssessmentAttemptsTable(attachedDatabase, alias);
  }
}

class AssessmentAttempt extends DataClass
    implements Insertable<AssessmentAttempt> {
  final String id;
  final DateTime startedAt;
  final DateTime deadlineAt;
  final DateTime? submittedAt;
  final String status;
  final int currentQuestionIndex;
  final String questionOrderJson;
  final String optionOrderJson;
  final String flaggedQuestionIdsJson;
  const AssessmentAttempt(
      {required this.id,
      required this.startedAt,
      required this.deadlineAt,
      this.submittedAt,
      required this.status,
      required this.currentQuestionIndex,
      required this.questionOrderJson,
      required this.optionOrderJson,
      required this.flaggedQuestionIdsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['started_at'] = Variable<DateTime>(startedAt);
    map['deadline_at'] = Variable<DateTime>(deadlineAt);
    if (!nullToAbsent || submittedAt != null) {
      map['submitted_at'] = Variable<DateTime>(submittedAt);
    }
    map['status'] = Variable<String>(status);
    map['current_question_index'] = Variable<int>(currentQuestionIndex);
    map['question_order_json'] = Variable<String>(questionOrderJson);
    map['option_order_json'] = Variable<String>(optionOrderJson);
    map['flagged_question_ids_json'] = Variable<String>(flaggedQuestionIdsJson);
    return map;
  }

  AssessmentAttemptsCompanion toCompanion(bool nullToAbsent) {
    return AssessmentAttemptsCompanion(
      id: Value(id),
      startedAt: Value(startedAt),
      deadlineAt: Value(deadlineAt),
      submittedAt: submittedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(submittedAt),
      status: Value(status),
      currentQuestionIndex: Value(currentQuestionIndex),
      questionOrderJson: Value(questionOrderJson),
      optionOrderJson: Value(optionOrderJson),
      flaggedQuestionIdsJson: Value(flaggedQuestionIdsJson),
    );
  }

  factory AssessmentAttempt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentAttempt(
      id: serializer.fromJson<String>(json['id']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      deadlineAt: serializer.fromJson<DateTime>(json['deadlineAt']),
      submittedAt: serializer.fromJson<DateTime?>(json['submittedAt']),
      status: serializer.fromJson<String>(json['status']),
      currentQuestionIndex:
          serializer.fromJson<int>(json['currentQuestionIndex']),
      questionOrderJson: serializer.fromJson<String>(json['questionOrderJson']),
      optionOrderJson: serializer.fromJson<String>(json['optionOrderJson']),
      flaggedQuestionIdsJson:
          serializer.fromJson<String>(json['flaggedQuestionIdsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'deadlineAt': serializer.toJson<DateTime>(deadlineAt),
      'submittedAt': serializer.toJson<DateTime?>(submittedAt),
      'status': serializer.toJson<String>(status),
      'currentQuestionIndex': serializer.toJson<int>(currentQuestionIndex),
      'questionOrderJson': serializer.toJson<String>(questionOrderJson),
      'optionOrderJson': serializer.toJson<String>(optionOrderJson),
      'flaggedQuestionIdsJson':
          serializer.toJson<String>(flaggedQuestionIdsJson),
    };
  }

  AssessmentAttempt copyWith(
          {String? id,
          DateTime? startedAt,
          DateTime? deadlineAt,
          Value<DateTime?> submittedAt = const Value.absent(),
          String? status,
          int? currentQuestionIndex,
          String? questionOrderJson,
          String? optionOrderJson,
          String? flaggedQuestionIdsJson}) =>
      AssessmentAttempt(
        id: id ?? this.id,
        startedAt: startedAt ?? this.startedAt,
        deadlineAt: deadlineAt ?? this.deadlineAt,
        submittedAt: submittedAt.present ? submittedAt.value : this.submittedAt,
        status: status ?? this.status,
        currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
        questionOrderJson: questionOrderJson ?? this.questionOrderJson,
        optionOrderJson: optionOrderJson ?? this.optionOrderJson,
        flaggedQuestionIdsJson:
            flaggedQuestionIdsJson ?? this.flaggedQuestionIdsJson,
      );
  AssessmentAttempt copyWithCompanion(AssessmentAttemptsCompanion data) {
    return AssessmentAttempt(
      id: data.id.present ? data.id.value : this.id,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      deadlineAt:
          data.deadlineAt.present ? data.deadlineAt.value : this.deadlineAt,
      submittedAt:
          data.submittedAt.present ? data.submittedAt.value : this.submittedAt,
      status: data.status.present ? data.status.value : this.status,
      currentQuestionIndex: data.currentQuestionIndex.present
          ? data.currentQuestionIndex.value
          : this.currentQuestionIndex,
      questionOrderJson: data.questionOrderJson.present
          ? data.questionOrderJson.value
          : this.questionOrderJson,
      optionOrderJson: data.optionOrderJson.present
          ? data.optionOrderJson.value
          : this.optionOrderJson,
      flaggedQuestionIdsJson: data.flaggedQuestionIdsJson.present
          ? data.flaggedQuestionIdsJson.value
          : this.flaggedQuestionIdsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentAttempt(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('deadlineAt: $deadlineAt, ')
          ..write('submittedAt: $submittedAt, ')
          ..write('status: $status, ')
          ..write('currentQuestionIndex: $currentQuestionIndex, ')
          ..write('questionOrderJson: $questionOrderJson, ')
          ..write('optionOrderJson: $optionOrderJson, ')
          ..write('flaggedQuestionIdsJson: $flaggedQuestionIdsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      startedAt,
      deadlineAt,
      submittedAt,
      status,
      currentQuestionIndex,
      questionOrderJson,
      optionOrderJson,
      flaggedQuestionIdsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentAttempt &&
          other.id == this.id &&
          other.startedAt == this.startedAt &&
          other.deadlineAt == this.deadlineAt &&
          other.submittedAt == this.submittedAt &&
          other.status == this.status &&
          other.currentQuestionIndex == this.currentQuestionIndex &&
          other.questionOrderJson == this.questionOrderJson &&
          other.optionOrderJson == this.optionOrderJson &&
          other.flaggedQuestionIdsJson == this.flaggedQuestionIdsJson);
}

class AssessmentAttemptsCompanion extends UpdateCompanion<AssessmentAttempt> {
  final Value<String> id;
  final Value<DateTime> startedAt;
  final Value<DateTime> deadlineAt;
  final Value<DateTime?> submittedAt;
  final Value<String> status;
  final Value<int> currentQuestionIndex;
  final Value<String> questionOrderJson;
  final Value<String> optionOrderJson;
  final Value<String> flaggedQuestionIdsJson;
  final Value<int> rowid;
  const AssessmentAttemptsCompanion({
    this.id = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.deadlineAt = const Value.absent(),
    this.submittedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.currentQuestionIndex = const Value.absent(),
    this.questionOrderJson = const Value.absent(),
    this.optionOrderJson = const Value.absent(),
    this.flaggedQuestionIdsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssessmentAttemptsCompanion.insert({
    required String id,
    required DateTime startedAt,
    required DateTime deadlineAt,
    this.submittedAt = const Value.absent(),
    required String status,
    this.currentQuestionIndex = const Value.absent(),
    required String questionOrderJson,
    this.optionOrderJson = const Value.absent(),
    this.flaggedQuestionIdsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        startedAt = Value(startedAt),
        deadlineAt = Value(deadlineAt),
        status = Value(status),
        questionOrderJson = Value(questionOrderJson);
  static Insertable<AssessmentAttempt> custom({
    Expression<String>? id,
    Expression<DateTime>? startedAt,
    Expression<DateTime>? deadlineAt,
    Expression<DateTime>? submittedAt,
    Expression<String>? status,
    Expression<int>? currentQuestionIndex,
    Expression<String>? questionOrderJson,
    Expression<String>? optionOrderJson,
    Expression<String>? flaggedQuestionIdsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startedAt != null) 'started_at': startedAt,
      if (deadlineAt != null) 'deadline_at': deadlineAt,
      if (submittedAt != null) 'submitted_at': submittedAt,
      if (status != null) 'status': status,
      if (currentQuestionIndex != null)
        'current_question_index': currentQuestionIndex,
      if (questionOrderJson != null) 'question_order_json': questionOrderJson,
      if (optionOrderJson != null) 'option_order_json': optionOrderJson,
      if (flaggedQuestionIdsJson != null)
        'flagged_question_ids_json': flaggedQuestionIdsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssessmentAttemptsCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? startedAt,
      Value<DateTime>? deadlineAt,
      Value<DateTime?>? submittedAt,
      Value<String>? status,
      Value<int>? currentQuestionIndex,
      Value<String>? questionOrderJson,
      Value<String>? optionOrderJson,
      Value<String>? flaggedQuestionIdsJson,
      Value<int>? rowid}) {
    return AssessmentAttemptsCompanion(
      id: id ?? this.id,
      startedAt: startedAt ?? this.startedAt,
      deadlineAt: deadlineAt ?? this.deadlineAt,
      submittedAt: submittedAt ?? this.submittedAt,
      status: status ?? this.status,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      questionOrderJson: questionOrderJson ?? this.questionOrderJson,
      optionOrderJson: optionOrderJson ?? this.optionOrderJson,
      flaggedQuestionIdsJson:
          flaggedQuestionIdsJson ?? this.flaggedQuestionIdsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (deadlineAt.present) {
      map['deadline_at'] = Variable<DateTime>(deadlineAt.value);
    }
    if (submittedAt.present) {
      map['submitted_at'] = Variable<DateTime>(submittedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (currentQuestionIndex.present) {
      map['current_question_index'] = Variable<int>(currentQuestionIndex.value);
    }
    if (questionOrderJson.present) {
      map['question_order_json'] = Variable<String>(questionOrderJson.value);
    }
    if (optionOrderJson.present) {
      map['option_order_json'] = Variable<String>(optionOrderJson.value);
    }
    if (flaggedQuestionIdsJson.present) {
      map['flagged_question_ids_json'] =
          Variable<String>(flaggedQuestionIdsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentAttemptsCompanion(')
          ..write('id: $id, ')
          ..write('startedAt: $startedAt, ')
          ..write('deadlineAt: $deadlineAt, ')
          ..write('submittedAt: $submittedAt, ')
          ..write('status: $status, ')
          ..write('currentQuestionIndex: $currentQuestionIndex, ')
          ..write('questionOrderJson: $questionOrderJson, ')
          ..write('optionOrderJson: $optionOrderJson, ')
          ..write('flaggedQuestionIdsJson: $flaggedQuestionIdsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssessmentAnswersTable extends AssessmentAnswers
    with TableInfo<$AssessmentAnswersTable, AssessmentAnswer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssessmentAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _attemptIdMeta =
      const VerificationMeta('attemptId');
  @override
  late final GeneratedColumn<String> attemptId = GeneratedColumn<String>(
      'attempt_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _questionIdMeta =
      const VerificationMeta('questionId');
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
      'question_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _selectedOptionIndexMeta =
      const VerificationMeta('selectedOptionIndex');
  @override
  late final GeneratedColumn<int> selectedOptionIndex = GeneratedColumn<int>(
      'selected_option_index', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, attemptId, questionId, selectedOptionIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assessment_answers';
  @override
  VerificationContext validateIntegrity(Insertable<AssessmentAnswer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('attempt_id')) {
      context.handle(_attemptIdMeta,
          attemptId.isAcceptableOrUnknown(data['attempt_id']!, _attemptIdMeta));
    } else if (isInserting) {
      context.missing(_attemptIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
          _questionIdMeta,
          questionId.isAcceptableOrUnknown(
              data['question_id']!, _questionIdMeta));
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('selected_option_index')) {
      context.handle(
          _selectedOptionIndexMeta,
          selectedOptionIndex.isAcceptableOrUnknown(
              data['selected_option_index']!, _selectedOptionIndexMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssessmentAnswer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentAnswer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      attemptId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}attempt_id'])!,
      questionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question_id'])!,
      selectedOptionIndex: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}selected_option_index']),
    );
  }

  @override
  $AssessmentAnswersTable createAlias(String alias) {
    return $AssessmentAnswersTable(attachedDatabase, alias);
  }
}

class AssessmentAnswer extends DataClass
    implements Insertable<AssessmentAnswer> {
  final int id;
  final String attemptId;
  final String questionId;
  final int? selectedOptionIndex;
  const AssessmentAnswer(
      {required this.id,
      required this.attemptId,
      required this.questionId,
      this.selectedOptionIndex});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['attempt_id'] = Variable<String>(attemptId);
    map['question_id'] = Variable<String>(questionId);
    if (!nullToAbsent || selectedOptionIndex != null) {
      map['selected_option_index'] = Variable<int>(selectedOptionIndex);
    }
    return map;
  }

  AssessmentAnswersCompanion toCompanion(bool nullToAbsent) {
    return AssessmentAnswersCompanion(
      id: Value(id),
      attemptId: Value(attemptId),
      questionId: Value(questionId),
      selectedOptionIndex: selectedOptionIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedOptionIndex),
    );
  }

  factory AssessmentAnswer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentAnswer(
      id: serializer.fromJson<int>(json['id']),
      attemptId: serializer.fromJson<String>(json['attemptId']),
      questionId: serializer.fromJson<String>(json['questionId']),
      selectedOptionIndex:
          serializer.fromJson<int?>(json['selectedOptionIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'attemptId': serializer.toJson<String>(attemptId),
      'questionId': serializer.toJson<String>(questionId),
      'selectedOptionIndex': serializer.toJson<int?>(selectedOptionIndex),
    };
  }

  AssessmentAnswer copyWith(
          {int? id,
          String? attemptId,
          String? questionId,
          Value<int?> selectedOptionIndex = const Value.absent()}) =>
      AssessmentAnswer(
        id: id ?? this.id,
        attemptId: attemptId ?? this.attemptId,
        questionId: questionId ?? this.questionId,
        selectedOptionIndex: selectedOptionIndex.present
            ? selectedOptionIndex.value
            : this.selectedOptionIndex,
      );
  AssessmentAnswer copyWithCompanion(AssessmentAnswersCompanion data) {
    return AssessmentAnswer(
      id: data.id.present ? data.id.value : this.id,
      attemptId: data.attemptId.present ? data.attemptId.value : this.attemptId,
      questionId:
          data.questionId.present ? data.questionId.value : this.questionId,
      selectedOptionIndex: data.selectedOptionIndex.present
          ? data.selectedOptionIndex.value
          : this.selectedOptionIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentAnswer(')
          ..write('id: $id, ')
          ..write('attemptId: $attemptId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedOptionIndex: $selectedOptionIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, attemptId, questionId, selectedOptionIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentAnswer &&
          other.id == this.id &&
          other.attemptId == this.attemptId &&
          other.questionId == this.questionId &&
          other.selectedOptionIndex == this.selectedOptionIndex);
}

class AssessmentAnswersCompanion extends UpdateCompanion<AssessmentAnswer> {
  final Value<int> id;
  final Value<String> attemptId;
  final Value<String> questionId;
  final Value<int?> selectedOptionIndex;
  const AssessmentAnswersCompanion({
    this.id = const Value.absent(),
    this.attemptId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.selectedOptionIndex = const Value.absent(),
  });
  AssessmentAnswersCompanion.insert({
    this.id = const Value.absent(),
    required String attemptId,
    required String questionId,
    this.selectedOptionIndex = const Value.absent(),
  })  : attemptId = Value(attemptId),
        questionId = Value(questionId);
  static Insertable<AssessmentAnswer> custom({
    Expression<int>? id,
    Expression<String>? attemptId,
    Expression<String>? questionId,
    Expression<int>? selectedOptionIndex,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (attemptId != null) 'attempt_id': attemptId,
      if (questionId != null) 'question_id': questionId,
      if (selectedOptionIndex != null)
        'selected_option_index': selectedOptionIndex,
    });
  }

  AssessmentAnswersCompanion copyWith(
      {Value<int>? id,
      Value<String>? attemptId,
      Value<String>? questionId,
      Value<int?>? selectedOptionIndex}) {
    return AssessmentAnswersCompanion(
      id: id ?? this.id,
      attemptId: attemptId ?? this.attemptId,
      questionId: questionId ?? this.questionId,
      selectedOptionIndex: selectedOptionIndex ?? this.selectedOptionIndex,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (attemptId.present) {
      map['attempt_id'] = Variable<String>(attemptId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (selectedOptionIndex.present) {
      map['selected_option_index'] = Variable<int>(selectedOptionIndex.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentAnswersCompanion(')
          ..write('id: $id, ')
          ..write('attemptId: $attemptId, ')
          ..write('questionId: $questionId, ')
          ..write('selectedOptionIndex: $selectedOptionIndex')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $ChaptersTable chapters = $ChaptersTable(this);
  late final $LearningUnitsTable learningUnits = $LearningUnitsTable(this);
  late final $ContentBlocksTable contentBlocks = $ContentBlocksTable(this);
  late final $KnowledgeChecksTable knowledgeChecks =
      $KnowledgeChecksTable(this);
  late final $LearningSessionsTable learningSessions =
      $LearningSessionsTable(this);
  late final $UnitPersonalDataTable unitPersonalData =
      $UnitPersonalDataTable(this);
  late final $KnowledgeCheckAttemptsTable knowledgeCheckAttempts =
      $KnowledgeCheckAttemptsTable(this);
  late final $AssessmentAttemptsTable assessmentAttempts =
      $AssessmentAttemptsTable(this);
  late final $AssessmentAnswersTable assessmentAnswers =
      $AssessmentAnswersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        subjects,
        chapters,
        learningUnits,
        contentBlocks,
        knowledgeChecks,
        learningSessions,
        unitPersonalData,
        knowledgeCheckAttempts,
        assessmentAttempts,
        assessmentAnswers
      ];
}

typedef $$SubjectsTableCreateCompanionBuilder = SubjectsCompanion Function({
  Value<int> id,
  required String title,
  Value<String?> description,
});
typedef $$SubjectsTableUpdateCompanionBuilder = SubjectsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String?> description,
});

class $$SubjectsTableFilterComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$SubjectsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SubjectsTable,
    Subject,
    $$SubjectsTableFilterComposer,
    $$SubjectsTableOrderingComposer,
    $$SubjectsTableAnnotationComposer,
    $$SubjectsTableCreateCompanionBuilder,
    $$SubjectsTableUpdateCompanionBuilder,
    (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
    Subject,
    PrefetchHooks Function()> {
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              SubjectsCompanion(
            id: id,
            title: title,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            Value<String?> description = const Value.absent(),
          }) =>
              SubjectsCompanion.insert(
            id: id,
            title: title,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SubjectsTable, Subject>(table),
                    BaseReferences<_$AppDatabase, $SubjectsTable, Subject>(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SubjectsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SubjectsTable,
    Subject,
    $$SubjectsTableFilterComposer,
    $$SubjectsTableOrderingComposer,
    $$SubjectsTableAnnotationComposer,
    $$SubjectsTableCreateCompanionBuilder,
    $$SubjectsTableUpdateCompanionBuilder,
    (Subject, BaseReferences<_$AppDatabase, $SubjectsTable, Subject>),
    Subject,
    PrefetchHooks Function()>;
typedef $$ChaptersTableCreateCompanionBuilder = ChaptersCompanion Function({
  Value<int> id,
  required int subjectId,
  required String title,
  Value<String?> description,
  Value<int> sortOrder,
});
typedef $$ChaptersTableUpdateCompanionBuilder = ChaptersCompanion Function({
  Value<int> id,
  Value<int> subjectId,
  Value<String> title,
  Value<String?> description,
  Value<int> sortOrder,
});

class $$ChaptersTableFilterComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));
}

class $$ChaptersTableOrderingComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));
}

class $$ChaptersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChaptersTable> {
  $$ChaptersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$ChaptersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ChaptersTable,
    Chapter,
    $$ChaptersTableFilterComposer,
    $$ChaptersTableOrderingComposer,
    $$ChaptersTableAnnotationComposer,
    $$ChaptersTableCreateCompanionBuilder,
    $$ChaptersTableUpdateCompanionBuilder,
    (Chapter, BaseReferences<_$AppDatabase, $ChaptersTable, Chapter>),
    Chapter,
    PrefetchHooks Function()> {
  $$ChaptersTableTableManager(_$AppDatabase db, $ChaptersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChaptersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChaptersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChaptersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> subjectId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
          }) =>
              ChaptersCompanion(
            id: id,
            subjectId: subjectId,
            title: title,
            description: description,
            sortOrder: sortOrder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int subjectId,
            required String title,
            Value<String?> description = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
          }) =>
              ChaptersCompanion.insert(
            id: id,
            subjectId: subjectId,
            title: title,
            description: description,
            sortOrder: sortOrder,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ChaptersTable, Chapter>(table),
                    BaseReferences<_$AppDatabase, $ChaptersTable, Chapter>(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ChaptersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ChaptersTable,
    Chapter,
    $$ChaptersTableFilterComposer,
    $$ChaptersTableOrderingComposer,
    $$ChaptersTableAnnotationComposer,
    $$ChaptersTableCreateCompanionBuilder,
    $$ChaptersTableUpdateCompanionBuilder,
    (Chapter, BaseReferences<_$AppDatabase, $ChaptersTable, Chapter>),
    Chapter,
    PrefetchHooks Function()>;
typedef $$LearningUnitsTableCreateCompanionBuilder = LearningUnitsCompanion
    Function({
  Value<int> id,
  required int chapterId,
  required String title,
  Value<String?> summary,
  Value<int> sortOrder,
});
typedef $$LearningUnitsTableUpdateCompanionBuilder = LearningUnitsCompanion
    Function({
  Value<int> id,
  Value<int> chapterId,
  Value<String> title,
  Value<String?> summary,
  Value<int> sortOrder,
});

class $$LearningUnitsTableFilterComposer
    extends Composer<_$AppDatabase, $LearningUnitsTable> {
  $$LearningUnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get chapterId => $composableBuilder(
      column: $table.chapterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));
}

class $$LearningUnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $LearningUnitsTable> {
  $$LearningUnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get chapterId => $composableBuilder(
      column: $table.chapterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));
}

class $$LearningUnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearningUnitsTable> {
  $$LearningUnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get chapterId =>
      $composableBuilder(column: $table.chapterId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$LearningUnitsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LearningUnitsTable,
    LearningUnit,
    $$LearningUnitsTableFilterComposer,
    $$LearningUnitsTableOrderingComposer,
    $$LearningUnitsTableAnnotationComposer,
    $$LearningUnitsTableCreateCompanionBuilder,
    $$LearningUnitsTableUpdateCompanionBuilder,
    (
      LearningUnit,
      BaseReferences<_$AppDatabase, $LearningUnitsTable, LearningUnit>
    ),
    LearningUnit,
    PrefetchHooks Function()> {
  $$LearningUnitsTableTableManager(_$AppDatabase db, $LearningUnitsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningUnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningUnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningUnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> chapterId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> summary = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
          }) =>
              LearningUnitsCompanion(
            id: id,
            chapterId: chapterId,
            title: title,
            summary: summary,
            sortOrder: sortOrder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int chapterId,
            required String title,
            Value<String?> summary = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
          }) =>
              LearningUnitsCompanion.insert(
            id: id,
            chapterId: chapterId,
            title: title,
            summary: summary,
            sortOrder: sortOrder,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$LearningUnitsTable, LearningUnit>(table),
                    BaseReferences<_$AppDatabase, $LearningUnitsTable,
                        LearningUnit>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LearningUnitsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LearningUnitsTable,
    LearningUnit,
    $$LearningUnitsTableFilterComposer,
    $$LearningUnitsTableOrderingComposer,
    $$LearningUnitsTableAnnotationComposer,
    $$LearningUnitsTableCreateCompanionBuilder,
    $$LearningUnitsTableUpdateCompanionBuilder,
    (
      LearningUnit,
      BaseReferences<_$AppDatabase, $LearningUnitsTable, LearningUnit>
    ),
    LearningUnit,
    PrefetchHooks Function()>;
typedef $$ContentBlocksTableCreateCompanionBuilder = ContentBlocksCompanion
    Function({
  Value<int> id,
  required int learningUnitId,
  required String blockType,
  required String contentText,
  Value<int> sortOrder,
});
typedef $$ContentBlocksTableUpdateCompanionBuilder = ContentBlocksCompanion
    Function({
  Value<int> id,
  Value<int> learningUnitId,
  Value<String> blockType,
  Value<String> contentText,
  Value<int> sortOrder,
});

class $$ContentBlocksTableFilterComposer
    extends Composer<_$AppDatabase, $ContentBlocksTable> {
  $$ContentBlocksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get blockType => $composableBuilder(
      column: $table.blockType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contentText => $composableBuilder(
      column: $table.contentText, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));
}

class $$ContentBlocksTableOrderingComposer
    extends Composer<_$AppDatabase, $ContentBlocksTable> {
  $$ContentBlocksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get blockType => $composableBuilder(
      column: $table.blockType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contentText => $composableBuilder(
      column: $table.contentText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));
}

class $$ContentBlocksTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContentBlocksTable> {
  $$ContentBlocksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId, builder: (column) => column);

  GeneratedColumn<String> get blockType =>
      $composableBuilder(column: $table.blockType, builder: (column) => column);

  GeneratedColumn<String> get contentText => $composableBuilder(
      column: $table.contentText, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);
}

class $$ContentBlocksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ContentBlocksTable,
    ContentBlock,
    $$ContentBlocksTableFilterComposer,
    $$ContentBlocksTableOrderingComposer,
    $$ContentBlocksTableAnnotationComposer,
    $$ContentBlocksTableCreateCompanionBuilder,
    $$ContentBlocksTableUpdateCompanionBuilder,
    (
      ContentBlock,
      BaseReferences<_$AppDatabase, $ContentBlocksTable, ContentBlock>
    ),
    ContentBlock,
    PrefetchHooks Function()> {
  $$ContentBlocksTableTableManager(_$AppDatabase db, $ContentBlocksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContentBlocksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContentBlocksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContentBlocksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> learningUnitId = const Value.absent(),
            Value<String> blockType = const Value.absent(),
            Value<String> contentText = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
          }) =>
              ContentBlocksCompanion(
            id: id,
            learningUnitId: learningUnitId,
            blockType: blockType,
            contentText: contentText,
            sortOrder: sortOrder,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int learningUnitId,
            required String blockType,
            required String contentText,
            Value<int> sortOrder = const Value.absent(),
          }) =>
              ContentBlocksCompanion.insert(
            id: id,
            learningUnitId: learningUnitId,
            blockType: blockType,
            contentText: contentText,
            sortOrder: sortOrder,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$ContentBlocksTable, ContentBlock>(table),
                    BaseReferences<_$AppDatabase, $ContentBlocksTable,
                        ContentBlock>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ContentBlocksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ContentBlocksTable,
    ContentBlock,
    $$ContentBlocksTableFilterComposer,
    $$ContentBlocksTableOrderingComposer,
    $$ContentBlocksTableAnnotationComposer,
    $$ContentBlocksTableCreateCompanionBuilder,
    $$ContentBlocksTableUpdateCompanionBuilder,
    (
      ContentBlock,
      BaseReferences<_$AppDatabase, $ContentBlocksTable, ContentBlock>
    ),
    ContentBlock,
    PrefetchHooks Function()>;
typedef $$KnowledgeChecksTableCreateCompanionBuilder = KnowledgeChecksCompanion
    Function({
  Value<int> id,
  required int learningUnitId,
  required String question,
  required String optionsJson,
  required int correctOptionIndex,
  Value<String?> explanation,
});
typedef $$KnowledgeChecksTableUpdateCompanionBuilder = KnowledgeChecksCompanion
    Function({
  Value<int> id,
  Value<int> learningUnitId,
  Value<String> question,
  Value<String> optionsJson,
  Value<int> correctOptionIndex,
  Value<String?> explanation,
});

class $$KnowledgeChecksTableFilterComposer
    extends Composer<_$AppDatabase, $KnowledgeChecksTable> {
  $$KnowledgeChecksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionsJson => $composableBuilder(
      column: $table.optionsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctOptionIndex => $composableBuilder(
      column: $table.correctOptionIndex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnFilters(column));
}

class $$KnowledgeChecksTableOrderingComposer
    extends Composer<_$AppDatabase, $KnowledgeChecksTable> {
  $$KnowledgeChecksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionsJson => $composableBuilder(
      column: $table.optionsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctOptionIndex => $composableBuilder(
      column: $table.correctOptionIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => ColumnOrderings(column));
}

class $$KnowledgeChecksTableAnnotationComposer
    extends Composer<_$AppDatabase, $KnowledgeChecksTable> {
  $$KnowledgeChecksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get optionsJson => $composableBuilder(
      column: $table.optionsJson, builder: (column) => column);

  GeneratedColumn<int> get correctOptionIndex => $composableBuilder(
      column: $table.correctOptionIndex, builder: (column) => column);

  GeneratedColumn<String> get explanation => $composableBuilder(
      column: $table.explanation, builder: (column) => column);
}

class $$KnowledgeChecksTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KnowledgeChecksTable,
    KnowledgeCheck,
    $$KnowledgeChecksTableFilterComposer,
    $$KnowledgeChecksTableOrderingComposer,
    $$KnowledgeChecksTableAnnotationComposer,
    $$KnowledgeChecksTableCreateCompanionBuilder,
    $$KnowledgeChecksTableUpdateCompanionBuilder,
    (
      KnowledgeCheck,
      BaseReferences<_$AppDatabase, $KnowledgeChecksTable, KnowledgeCheck>
    ),
    KnowledgeCheck,
    PrefetchHooks Function()> {
  $$KnowledgeChecksTableTableManager(
      _$AppDatabase db, $KnowledgeChecksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KnowledgeChecksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KnowledgeChecksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KnowledgeChecksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> learningUnitId = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> optionsJson = const Value.absent(),
            Value<int> correctOptionIndex = const Value.absent(),
            Value<String?> explanation = const Value.absent(),
          }) =>
              KnowledgeChecksCompanion(
            id: id,
            learningUnitId: learningUnitId,
            question: question,
            optionsJson: optionsJson,
            correctOptionIndex: correctOptionIndex,
            explanation: explanation,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int learningUnitId,
            required String question,
            required String optionsJson,
            required int correctOptionIndex,
            Value<String?> explanation = const Value.absent(),
          }) =>
              KnowledgeChecksCompanion.insert(
            id: id,
            learningUnitId: learningUnitId,
            question: question,
            optionsJson: optionsJson,
            correctOptionIndex: correctOptionIndex,
            explanation: explanation,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$KnowledgeChecksTable, KnowledgeCheck>(table),
                    BaseReferences<_$AppDatabase, $KnowledgeChecksTable,
                        KnowledgeCheck>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$KnowledgeChecksTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $KnowledgeChecksTable,
    KnowledgeCheck,
    $$KnowledgeChecksTableFilterComposer,
    $$KnowledgeChecksTableOrderingComposer,
    $$KnowledgeChecksTableAnnotationComposer,
    $$KnowledgeChecksTableCreateCompanionBuilder,
    $$KnowledgeChecksTableUpdateCompanionBuilder,
    (
      KnowledgeCheck,
      BaseReferences<_$AppDatabase, $KnowledgeChecksTable, KnowledgeCheck>
    ),
    KnowledgeCheck,
    PrefetchHooks Function()>;
typedef $$LearningSessionsTableCreateCompanionBuilder
    = LearningSessionsCompanion Function({
  Value<int> id,
  required int subjectId,
  required int chapterId,
  required int learningUnitId,
  Value<double> scrollPosition,
  Value<bool> completed,
  Value<double> progress,
  Value<DateTime?> sessionStartedAt,
  Value<int> totalStudySeconds,
  Value<DateTime?> lastActivityAt,
});
typedef $$LearningSessionsTableUpdateCompanionBuilder
    = LearningSessionsCompanion Function({
  Value<int> id,
  Value<int> subjectId,
  Value<int> chapterId,
  Value<int> learningUnitId,
  Value<double> scrollPosition,
  Value<bool> completed,
  Value<double> progress,
  Value<DateTime?> sessionStartedAt,
  Value<int> totalStudySeconds,
  Value<DateTime?> lastActivityAt,
});

class $$LearningSessionsTableFilterComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get chapterId => $composableBuilder(
      column: $table.chapterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get scrollPosition => $composableBuilder(
      column: $table.scrollPosition,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get sessionStartedAt => $composableBuilder(
      column: $table.sessionStartedAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalStudySeconds => $composableBuilder(
      column: $table.totalStudySeconds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt,
      builder: (column) => ColumnFilters(column));
}

class $$LearningSessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get subjectId => $composableBuilder(
      column: $table.subjectId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get chapterId => $composableBuilder(
      column: $table.chapterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get scrollPosition => $composableBuilder(
      column: $table.scrollPosition,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get sessionStartedAt => $composableBuilder(
      column: $table.sessionStartedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalStudySeconds => $composableBuilder(
      column: $table.totalStudySeconds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt,
      builder: (column) => ColumnOrderings(column));
}

class $$LearningSessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LearningSessionsTable> {
  $$LearningSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get subjectId =>
      $composableBuilder(column: $table.subjectId, builder: (column) => column);

  GeneratedColumn<int> get chapterId =>
      $composableBuilder(column: $table.chapterId, builder: (column) => column);

  GeneratedColumn<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId, builder: (column) => column);

  GeneratedColumn<double> get scrollPosition => $composableBuilder(
      column: $table.scrollPosition, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<DateTime> get sessionStartedAt => $composableBuilder(
      column: $table.sessionStartedAt, builder: (column) => column);

  GeneratedColumn<int> get totalStudySeconds => $composableBuilder(
      column: $table.totalStudySeconds, builder: (column) => column);

  GeneratedColumn<DateTime> get lastActivityAt => $composableBuilder(
      column: $table.lastActivityAt, builder: (column) => column);
}

class $$LearningSessionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LearningSessionsTable,
    LearningSession,
    $$LearningSessionsTableFilterComposer,
    $$LearningSessionsTableOrderingComposer,
    $$LearningSessionsTableAnnotationComposer,
    $$LearningSessionsTableCreateCompanionBuilder,
    $$LearningSessionsTableUpdateCompanionBuilder,
    (
      LearningSession,
      BaseReferences<_$AppDatabase, $LearningSessionsTable, LearningSession>
    ),
    LearningSession,
    PrefetchHooks Function()> {
  $$LearningSessionsTableTableManager(
      _$AppDatabase db, $LearningSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LearningSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LearningSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LearningSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> subjectId = const Value.absent(),
            Value<int> chapterId = const Value.absent(),
            Value<int> learningUnitId = const Value.absent(),
            Value<double> scrollPosition = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<DateTime?> sessionStartedAt = const Value.absent(),
            Value<int> totalStudySeconds = const Value.absent(),
            Value<DateTime?> lastActivityAt = const Value.absent(),
          }) =>
              LearningSessionsCompanion(
            id: id,
            subjectId: subjectId,
            chapterId: chapterId,
            learningUnitId: learningUnitId,
            scrollPosition: scrollPosition,
            completed: completed,
            progress: progress,
            sessionStartedAt: sessionStartedAt,
            totalStudySeconds: totalStudySeconds,
            lastActivityAt: lastActivityAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int subjectId,
            required int chapterId,
            required int learningUnitId,
            Value<double> scrollPosition = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<double> progress = const Value.absent(),
            Value<DateTime?> sessionStartedAt = const Value.absent(),
            Value<int> totalStudySeconds = const Value.absent(),
            Value<DateTime?> lastActivityAt = const Value.absent(),
          }) =>
              LearningSessionsCompanion.insert(
            id: id,
            subjectId: subjectId,
            chapterId: chapterId,
            learningUnitId: learningUnitId,
            scrollPosition: scrollPosition,
            completed: completed,
            progress: progress,
            sessionStartedAt: sessionStartedAt,
            totalStudySeconds: totalStudySeconds,
            lastActivityAt: lastActivityAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$LearningSessionsTable, LearningSession>(table),
                    BaseReferences<_$AppDatabase, $LearningSessionsTable,
                        LearningSession>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$LearningSessionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LearningSessionsTable,
    LearningSession,
    $$LearningSessionsTableFilterComposer,
    $$LearningSessionsTableOrderingComposer,
    $$LearningSessionsTableAnnotationComposer,
    $$LearningSessionsTableCreateCompanionBuilder,
    $$LearningSessionsTableUpdateCompanionBuilder,
    (
      LearningSession,
      BaseReferences<_$AppDatabase, $LearningSessionsTable, LearningSession>
    ),
    LearningSession,
    PrefetchHooks Function()>;
typedef $$UnitPersonalDataTableCreateCompanionBuilder
    = UnitPersonalDataCompanion Function({
  Value<int> learningUnitId,
  Value<bool> bookmarked,
  Value<String?> note,
  required DateTime updatedAt,
});
typedef $$UnitPersonalDataTableUpdateCompanionBuilder
    = UnitPersonalDataCompanion Function({
  Value<int> learningUnitId,
  Value<bool> bookmarked,
  Value<String?> note,
  Value<DateTime> updatedAt,
});

class $$UnitPersonalDataTableFilterComposer
    extends Composer<_$AppDatabase, $UnitPersonalDataTable> {
  $$UnitPersonalDataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UnitPersonalDataTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitPersonalDataTable> {
  $$UnitPersonalDataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UnitPersonalDataTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitPersonalDataTable> {
  $$UnitPersonalDataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get learningUnitId => $composableBuilder(
      column: $table.learningUnitId, builder: (column) => column);

  GeneratedColumn<bool> get bookmarked => $composableBuilder(
      column: $table.bookmarked, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UnitPersonalDataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UnitPersonalDataTable,
    UnitPersonalDataData,
    $$UnitPersonalDataTableFilterComposer,
    $$UnitPersonalDataTableOrderingComposer,
    $$UnitPersonalDataTableAnnotationComposer,
    $$UnitPersonalDataTableCreateCompanionBuilder,
    $$UnitPersonalDataTableUpdateCompanionBuilder,
    (
      UnitPersonalDataData,
      BaseReferences<_$AppDatabase, $UnitPersonalDataTable,
          UnitPersonalDataData>
    ),
    UnitPersonalDataData,
    PrefetchHooks Function()> {
  $$UnitPersonalDataTableTableManager(
      _$AppDatabase db, $UnitPersonalDataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitPersonalDataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitPersonalDataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitPersonalDataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> learningUnitId = const Value.absent(),
            Value<bool> bookmarked = const Value.absent(),
            Value<String?> note = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              UnitPersonalDataCompanion(
            learningUnitId: learningUnitId,
            bookmarked: bookmarked,
            note: note,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> learningUnitId = const Value.absent(),
            Value<bool> bookmarked = const Value.absent(),
            Value<String?> note = const Value.absent(),
            required DateTime updatedAt,
          }) =>
              UnitPersonalDataCompanion.insert(
            learningUnitId: learningUnitId,
            bookmarked: bookmarked,
            note: note,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$UnitPersonalDataTable, UnitPersonalDataData>(
                        table),
                    BaseReferences<_$AppDatabase, $UnitPersonalDataTable,
                        UnitPersonalDataData>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UnitPersonalDataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UnitPersonalDataTable,
    UnitPersonalDataData,
    $$UnitPersonalDataTableFilterComposer,
    $$UnitPersonalDataTableOrderingComposer,
    $$UnitPersonalDataTableAnnotationComposer,
    $$UnitPersonalDataTableCreateCompanionBuilder,
    $$UnitPersonalDataTableUpdateCompanionBuilder,
    (
      UnitPersonalDataData,
      BaseReferences<_$AppDatabase, $UnitPersonalDataTable,
          UnitPersonalDataData>
    ),
    UnitPersonalDataData,
    PrefetchHooks Function()>;
typedef $$KnowledgeCheckAttemptsTableCreateCompanionBuilder
    = KnowledgeCheckAttemptsCompanion Function({
  Value<int> knowledgeCheckId,
  required int selectedOptionIndex,
  required bool isCorrect,
  required DateTime answeredAt,
});
typedef $$KnowledgeCheckAttemptsTableUpdateCompanionBuilder
    = KnowledgeCheckAttemptsCompanion Function({
  Value<int> knowledgeCheckId,
  Value<int> selectedOptionIndex,
  Value<bool> isCorrect,
  Value<DateTime> answeredAt,
});

class $$KnowledgeCheckAttemptsTableFilterComposer
    extends Composer<_$AppDatabase, $KnowledgeCheckAttemptsTable> {
  $$KnowledgeCheckAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get knowledgeCheckId => $composableBuilder(
      column: $table.knowledgeCheckId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get selectedOptionIndex => $composableBuilder(
      column: $table.selectedOptionIndex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get answeredAt => $composableBuilder(
      column: $table.answeredAt, builder: (column) => ColumnFilters(column));
}

class $$KnowledgeCheckAttemptsTableOrderingComposer
    extends Composer<_$AppDatabase, $KnowledgeCheckAttemptsTable> {
  $$KnowledgeCheckAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get knowledgeCheckId => $composableBuilder(
      column: $table.knowledgeCheckId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get selectedOptionIndex => $composableBuilder(
      column: $table.selectedOptionIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
      column: $table.isCorrect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get answeredAt => $composableBuilder(
      column: $table.answeredAt, builder: (column) => ColumnOrderings(column));
}

class $$KnowledgeCheckAttemptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $KnowledgeCheckAttemptsTable> {
  $$KnowledgeCheckAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get knowledgeCheckId => $composableBuilder(
      column: $table.knowledgeCheckId, builder: (column) => column);

  GeneratedColumn<int> get selectedOptionIndex => $composableBuilder(
      column: $table.selectedOptionIndex, builder: (column) => column);

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<DateTime> get answeredAt => $composableBuilder(
      column: $table.answeredAt, builder: (column) => column);
}

class $$KnowledgeCheckAttemptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $KnowledgeCheckAttemptsTable,
    KnowledgeCheckAttempt,
    $$KnowledgeCheckAttemptsTableFilterComposer,
    $$KnowledgeCheckAttemptsTableOrderingComposer,
    $$KnowledgeCheckAttemptsTableAnnotationComposer,
    $$KnowledgeCheckAttemptsTableCreateCompanionBuilder,
    $$KnowledgeCheckAttemptsTableUpdateCompanionBuilder,
    (
      KnowledgeCheckAttempt,
      BaseReferences<_$AppDatabase, $KnowledgeCheckAttemptsTable,
          KnowledgeCheckAttempt>
    ),
    KnowledgeCheckAttempt,
    PrefetchHooks Function()> {
  $$KnowledgeCheckAttemptsTableTableManager(
      _$AppDatabase db, $KnowledgeCheckAttemptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KnowledgeCheckAttemptsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$KnowledgeCheckAttemptsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KnowledgeCheckAttemptsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> knowledgeCheckId = const Value.absent(),
            Value<int> selectedOptionIndex = const Value.absent(),
            Value<bool> isCorrect = const Value.absent(),
            Value<DateTime> answeredAt = const Value.absent(),
          }) =>
              KnowledgeCheckAttemptsCompanion(
            knowledgeCheckId: knowledgeCheckId,
            selectedOptionIndex: selectedOptionIndex,
            isCorrect: isCorrect,
            answeredAt: answeredAt,
          ),
          createCompanionCallback: ({
            Value<int> knowledgeCheckId = const Value.absent(),
            required int selectedOptionIndex,
            required bool isCorrect,
            required DateTime answeredAt,
          }) =>
              KnowledgeCheckAttemptsCompanion.insert(
            knowledgeCheckId: knowledgeCheckId,
            selectedOptionIndex: selectedOptionIndex,
            isCorrect: isCorrect,
            answeredAt: answeredAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$KnowledgeCheckAttemptsTable,
                        KnowledgeCheckAttempt>(table),
                    BaseReferences<_$AppDatabase, $KnowledgeCheckAttemptsTable,
                        KnowledgeCheckAttempt>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$KnowledgeCheckAttemptsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $KnowledgeCheckAttemptsTable,
        KnowledgeCheckAttempt,
        $$KnowledgeCheckAttemptsTableFilterComposer,
        $$KnowledgeCheckAttemptsTableOrderingComposer,
        $$KnowledgeCheckAttemptsTableAnnotationComposer,
        $$KnowledgeCheckAttemptsTableCreateCompanionBuilder,
        $$KnowledgeCheckAttemptsTableUpdateCompanionBuilder,
        (
          KnowledgeCheckAttempt,
          BaseReferences<_$AppDatabase, $KnowledgeCheckAttemptsTable,
              KnowledgeCheckAttempt>
        ),
        KnowledgeCheckAttempt,
        PrefetchHooks Function()>;
typedef $$AssessmentAttemptsTableCreateCompanionBuilder
    = AssessmentAttemptsCompanion Function({
  required String id,
  required DateTime startedAt,
  required DateTime deadlineAt,
  Value<DateTime?> submittedAt,
  required String status,
  Value<int> currentQuestionIndex,
  required String questionOrderJson,
  Value<String> optionOrderJson,
  Value<String> flaggedQuestionIdsJson,
  Value<int> rowid,
});
typedef $$AssessmentAttemptsTableUpdateCompanionBuilder
    = AssessmentAttemptsCompanion Function({
  Value<String> id,
  Value<DateTime> startedAt,
  Value<DateTime> deadlineAt,
  Value<DateTime?> submittedAt,
  Value<String> status,
  Value<int> currentQuestionIndex,
  Value<String> questionOrderJson,
  Value<String> optionOrderJson,
  Value<String> flaggedQuestionIdsJson,
  Value<int> rowid,
});

class $$AssessmentAttemptsTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentAttemptsTable> {
  $$AssessmentAttemptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deadlineAt => $composableBuilder(
      column: $table.deadlineAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get submittedAt => $composableBuilder(
      column: $table.submittedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get questionOrderJson => $composableBuilder(
      column: $table.questionOrderJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionOrderJson => $composableBuilder(
      column: $table.optionOrderJson,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get flaggedQuestionIdsJson => $composableBuilder(
      column: $table.flaggedQuestionIdsJson,
      builder: (column) => ColumnFilters(column));
}

class $$AssessmentAttemptsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentAttemptsTable> {
  $$AssessmentAttemptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deadlineAt => $composableBuilder(
      column: $table.deadlineAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get submittedAt => $composableBuilder(
      column: $table.submittedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get questionOrderJson => $composableBuilder(
      column: $table.questionOrderJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionOrderJson => $composableBuilder(
      column: $table.optionOrderJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get flaggedQuestionIdsJson => $composableBuilder(
      column: $table.flaggedQuestionIdsJson,
      builder: (column) => ColumnOrderings(column));
}

class $$AssessmentAttemptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentAttemptsTable> {
  $$AssessmentAttemptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deadlineAt => $composableBuilder(
      column: $table.deadlineAt, builder: (column) => column);

  GeneratedColumn<DateTime> get submittedAt => $composableBuilder(
      column: $table.submittedAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get currentQuestionIndex => $composableBuilder(
      column: $table.currentQuestionIndex, builder: (column) => column);

  GeneratedColumn<String> get questionOrderJson => $composableBuilder(
      column: $table.questionOrderJson, builder: (column) => column);

  GeneratedColumn<String> get optionOrderJson => $composableBuilder(
      column: $table.optionOrderJson, builder: (column) => column);

  GeneratedColumn<String> get flaggedQuestionIdsJson => $composableBuilder(
      column: $table.flaggedQuestionIdsJson, builder: (column) => column);
}

class $$AssessmentAttemptsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssessmentAttemptsTable,
    AssessmentAttempt,
    $$AssessmentAttemptsTableFilterComposer,
    $$AssessmentAttemptsTableOrderingComposer,
    $$AssessmentAttemptsTableAnnotationComposer,
    $$AssessmentAttemptsTableCreateCompanionBuilder,
    $$AssessmentAttemptsTableUpdateCompanionBuilder,
    (
      AssessmentAttempt,
      BaseReferences<_$AppDatabase, $AssessmentAttemptsTable, AssessmentAttempt>
    ),
    AssessmentAttempt,
    PrefetchHooks Function()> {
  $$AssessmentAttemptsTableTableManager(
      _$AppDatabase db, $AssessmentAttemptsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentAttemptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentAttemptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentAttemptsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> startedAt = const Value.absent(),
            Value<DateTime> deadlineAt = const Value.absent(),
            Value<DateTime?> submittedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> currentQuestionIndex = const Value.absent(),
            Value<String> questionOrderJson = const Value.absent(),
            Value<String> optionOrderJson = const Value.absent(),
            Value<String> flaggedQuestionIdsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssessmentAttemptsCompanion(
            id: id,
            startedAt: startedAt,
            deadlineAt: deadlineAt,
            submittedAt: submittedAt,
            status: status,
            currentQuestionIndex: currentQuestionIndex,
            questionOrderJson: questionOrderJson,
            optionOrderJson: optionOrderJson,
            flaggedQuestionIdsJson: flaggedQuestionIdsJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime startedAt,
            required DateTime deadlineAt,
            Value<DateTime?> submittedAt = const Value.absent(),
            required String status,
            Value<int> currentQuestionIndex = const Value.absent(),
            required String questionOrderJson,
            Value<String> optionOrderJson = const Value.absent(),
            Value<String> flaggedQuestionIdsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssessmentAttemptsCompanion.insert(
            id: id,
            startedAt: startedAt,
            deadlineAt: deadlineAt,
            submittedAt: submittedAt,
            status: status,
            currentQuestionIndex: currentQuestionIndex,
            questionOrderJson: questionOrderJson,
            optionOrderJson: optionOrderJson,
            flaggedQuestionIdsJson: flaggedQuestionIdsJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AssessmentAttemptsTable, AssessmentAttempt>(
                        table),
                    BaseReferences<_$AppDatabase, $AssessmentAttemptsTable,
                        AssessmentAttempt>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssessmentAttemptsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssessmentAttemptsTable,
    AssessmentAttempt,
    $$AssessmentAttemptsTableFilterComposer,
    $$AssessmentAttemptsTableOrderingComposer,
    $$AssessmentAttemptsTableAnnotationComposer,
    $$AssessmentAttemptsTableCreateCompanionBuilder,
    $$AssessmentAttemptsTableUpdateCompanionBuilder,
    (
      AssessmentAttempt,
      BaseReferences<_$AppDatabase, $AssessmentAttemptsTable, AssessmentAttempt>
    ),
    AssessmentAttempt,
    PrefetchHooks Function()>;
typedef $$AssessmentAnswersTableCreateCompanionBuilder
    = AssessmentAnswersCompanion Function({
  Value<int> id,
  required String attemptId,
  required String questionId,
  Value<int?> selectedOptionIndex,
});
typedef $$AssessmentAnswersTableUpdateCompanionBuilder
    = AssessmentAnswersCompanion Function({
  Value<int> id,
  Value<String> attemptId,
  Value<String> questionId,
  Value<int?> selectedOptionIndex,
});

class $$AssessmentAnswersTableFilterComposer
    extends Composer<_$AppDatabase, $AssessmentAnswersTable> {
  $$AssessmentAnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attemptId => $composableBuilder(
      column: $table.attemptId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get selectedOptionIndex => $composableBuilder(
      column: $table.selectedOptionIndex,
      builder: (column) => ColumnFilters(column));
}

class $$AssessmentAnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $AssessmentAnswersTable> {
  $$AssessmentAnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attemptId => $composableBuilder(
      column: $table.attemptId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get selectedOptionIndex => $composableBuilder(
      column: $table.selectedOptionIndex,
      builder: (column) => ColumnOrderings(column));
}

class $$AssessmentAnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssessmentAnswersTable> {
  $$AssessmentAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get attemptId =>
      $composableBuilder(column: $table.attemptId, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
      column: $table.questionId, builder: (column) => column);

  GeneratedColumn<int> get selectedOptionIndex => $composableBuilder(
      column: $table.selectedOptionIndex, builder: (column) => column);
}

class $$AssessmentAnswersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssessmentAnswersTable,
    AssessmentAnswer,
    $$AssessmentAnswersTableFilterComposer,
    $$AssessmentAnswersTableOrderingComposer,
    $$AssessmentAnswersTableAnnotationComposer,
    $$AssessmentAnswersTableCreateCompanionBuilder,
    $$AssessmentAnswersTableUpdateCompanionBuilder,
    (
      AssessmentAnswer,
      BaseReferences<_$AppDatabase, $AssessmentAnswersTable, AssessmentAnswer>
    ),
    AssessmentAnswer,
    PrefetchHooks Function()> {
  $$AssessmentAnswersTableTableManager(
      _$AppDatabase db, $AssessmentAnswersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssessmentAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssessmentAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssessmentAnswersTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> attemptId = const Value.absent(),
            Value<String> questionId = const Value.absent(),
            Value<int?> selectedOptionIndex = const Value.absent(),
          }) =>
              AssessmentAnswersCompanion(
            id: id,
            attemptId: attemptId,
            questionId: questionId,
            selectedOptionIndex: selectedOptionIndex,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String attemptId,
            required String questionId,
            Value<int?> selectedOptionIndex = const Value.absent(),
          }) =>
              AssessmentAnswersCompanion.insert(
            id: id,
            attemptId: attemptId,
            questionId: questionId,
            selectedOptionIndex: selectedOptionIndex,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AssessmentAnswersTable, AssessmentAnswer>(
                        table),
                    BaseReferences<_$AppDatabase, $AssessmentAnswersTable,
                        AssessmentAnswer>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssessmentAnswersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssessmentAnswersTable,
    AssessmentAnswer,
    $$AssessmentAnswersTableFilterComposer,
    $$AssessmentAnswersTableOrderingComposer,
    $$AssessmentAnswersTableAnnotationComposer,
    $$AssessmentAnswersTableCreateCompanionBuilder,
    $$AssessmentAnswersTableUpdateCompanionBuilder,
    (
      AssessmentAnswer,
      BaseReferences<_$AppDatabase, $AssessmentAnswersTable, AssessmentAnswer>
    ),
    AssessmentAnswer,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$ChaptersTableTableManager get chapters =>
      $$ChaptersTableTableManager(_db, _db.chapters);
  $$LearningUnitsTableTableManager get learningUnits =>
      $$LearningUnitsTableTableManager(_db, _db.learningUnits);
  $$ContentBlocksTableTableManager get contentBlocks =>
      $$ContentBlocksTableTableManager(_db, _db.contentBlocks);
  $$KnowledgeChecksTableTableManager get knowledgeChecks =>
      $$KnowledgeChecksTableTableManager(_db, _db.knowledgeChecks);
  $$LearningSessionsTableTableManager get learningSessions =>
      $$LearningSessionsTableTableManager(_db, _db.learningSessions);
  $$UnitPersonalDataTableTableManager get unitPersonalData =>
      $$UnitPersonalDataTableTableManager(_db, _db.unitPersonalData);
  $$KnowledgeCheckAttemptsTableTableManager get knowledgeCheckAttempts =>
      $$KnowledgeCheckAttemptsTableTableManager(
          _db, _db.knowledgeCheckAttempts);
  $$AssessmentAttemptsTableTableManager get assessmentAttempts =>
      $$AssessmentAttemptsTableTableManager(_db, _db.assessmentAttempts);
  $$AssessmentAnswersTableTableManager get assessmentAnswers =>
      $$AssessmentAnswersTableTableManager(_db, _db.assessmentAnswers);
}
