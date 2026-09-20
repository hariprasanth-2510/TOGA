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
        learningSessions
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
}
