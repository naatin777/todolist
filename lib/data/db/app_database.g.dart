// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class TaskList extends DataClass implements Insertable<TaskList> {
  final String id;
  final String title;
  const TaskList({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  TaskListsCompanion toCompanion(bool nullToAbsent) {
    return TaskListsCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory TaskList.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskList(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  TaskList copyWith({String? id, String? title}) => TaskList(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  @override
  String toString() {
    return (StringBuffer('TaskList(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskList && other.id == this.id && other.title == this.title);
}

class TaskListsCompanion extends UpdateCompanion<TaskList> {
  final Value<String> id;
  final Value<String> title;
  const TaskListsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  TaskListsCompanion.insert({
    required String id,
    required String title,
  })  : id = Value(id),
        title = Value(title);
  static Insertable<TaskList> custom({
    Expression<String>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  TaskListsCompanion copyWith({Value<String>? id, Value<String>? title}) {
    return TaskListsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskListsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $TaskListsTable extends TaskLists
    with TableInfo<$TaskListsTable, TaskList> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskListsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? 'task_lists';
  @override
  String get actualTableName => 'task_lists';
  @override
  VerificationContext validateIntegrity(Insertable<TaskList> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TaskList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskList(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $TaskListsTable createAlias(String alias) {
    return $TaskListsTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String listId;
  final String title;
  final bool check;
  final int priority;
  final DateTime? deadlineDate;
  final DateTime? deadlineTime;
  final String? subtask;
  final String? description;
  const Task(
      {required this.id,
      required this.listId,
      required this.title,
      required this.check,
      required this.priority,
      this.deadlineDate,
      this.deadlineTime,
      this.subtask,
      this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['list_id'] = Variable<String>(listId);
    map['title'] = Variable<String>(title);
    map['check'] = Variable<bool>(check);
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || deadlineDate != null) {
      map['deadline_date'] = Variable<DateTime>(deadlineDate);
    }
    if (!nullToAbsent || deadlineTime != null) {
      map['deadline_time'] = Variable<DateTime>(deadlineTime);
    }
    if (!nullToAbsent || subtask != null) {
      map['subtask'] = Variable<String>(subtask);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      listId: Value(listId),
      title: Value(title),
      check: Value(check),
      priority: Value(priority),
      deadlineDate: deadlineDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deadlineDate),
      deadlineTime: deadlineTime == null && nullToAbsent
          ? const Value.absent()
          : Value(deadlineTime),
      subtask: subtask == null && nullToAbsent
          ? const Value.absent()
          : Value(subtask),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      listId: serializer.fromJson<String>(json['listId']),
      title: serializer.fromJson<String>(json['title']),
      check: serializer.fromJson<bool>(json['check']),
      priority: serializer.fromJson<int>(json['priority']),
      deadlineDate: serializer.fromJson<DateTime?>(json['deadlineDate']),
      deadlineTime: serializer.fromJson<DateTime?>(json['deadlineTime']),
      subtask: serializer.fromJson<String?>(json['subtask']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'listId': serializer.toJson<String>(listId),
      'title': serializer.toJson<String>(title),
      'check': serializer.toJson<bool>(check),
      'priority': serializer.toJson<int>(priority),
      'deadlineDate': serializer.toJson<DateTime?>(deadlineDate),
      'deadlineTime': serializer.toJson<DateTime?>(deadlineTime),
      'subtask': serializer.toJson<String?>(subtask),
      'description': serializer.toJson<String?>(description),
    };
  }

  Task copyWith(
          {String? id,
          String? listId,
          String? title,
          bool? check,
          int? priority,
          Value<DateTime?> deadlineDate = const Value.absent(),
          Value<DateTime?> deadlineTime = const Value.absent(),
          Value<String?> subtask = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      Task(
        id: id ?? this.id,
        listId: listId ?? this.listId,
        title: title ?? this.title,
        check: check ?? this.check,
        priority: priority ?? this.priority,
        deadlineDate:
            deadlineDate.present ? deadlineDate.value : this.deadlineDate,
        deadlineTime:
            deadlineTime.present ? deadlineTime.value : this.deadlineTime,
        subtask: subtask.present ? subtask.value : this.subtask,
        description: description.present ? description.value : this.description,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('title: $title, ')
          ..write('check: $check, ')
          ..write('priority: $priority, ')
          ..write('deadlineDate: $deadlineDate, ')
          ..write('deadlineTime: $deadlineTime, ')
          ..write('subtask: $subtask, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, listId, title, check, priority,
      deadlineDate, deadlineTime, subtask, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.listId == this.listId &&
          other.title == this.title &&
          other.check == this.check &&
          other.priority == this.priority &&
          other.deadlineDate == this.deadlineDate &&
          other.deadlineTime == this.deadlineTime &&
          other.subtask == this.subtask &&
          other.description == this.description);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> listId;
  final Value<String> title;
  final Value<bool> check;
  final Value<int> priority;
  final Value<DateTime?> deadlineDate;
  final Value<DateTime?> deadlineTime;
  final Value<String?> subtask;
  final Value<String?> description;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.listId = const Value.absent(),
    this.title = const Value.absent(),
    this.check = const Value.absent(),
    this.priority = const Value.absent(),
    this.deadlineDate = const Value.absent(),
    this.deadlineTime = const Value.absent(),
    this.subtask = const Value.absent(),
    this.description = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String listId,
    required String title,
    required bool check,
    required int priority,
    this.deadlineDate = const Value.absent(),
    this.deadlineTime = const Value.absent(),
    this.subtask = const Value.absent(),
    this.description = const Value.absent(),
  })  : id = Value(id),
        listId = Value(listId),
        title = Value(title),
        check = Value(check),
        priority = Value(priority);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? listId,
    Expression<String>? title,
    Expression<bool>? check,
    Expression<int>? priority,
    Expression<DateTime>? deadlineDate,
    Expression<DateTime>? deadlineTime,
    Expression<String>? subtask,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (listId != null) 'list_id': listId,
      if (title != null) 'title': title,
      if (check != null) 'check': check,
      if (priority != null) 'priority': priority,
      if (deadlineDate != null) 'deadline_date': deadlineDate,
      if (deadlineTime != null) 'deadline_time': deadlineTime,
      if (subtask != null) 'subtask': subtask,
      if (description != null) 'description': description,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? listId,
      Value<String>? title,
      Value<bool>? check,
      Value<int>? priority,
      Value<DateTime?>? deadlineDate,
      Value<DateTime?>? deadlineTime,
      Value<String?>? subtask,
      Value<String?>? description}) {
    return TasksCompanion(
      id: id ?? this.id,
      listId: listId ?? this.listId,
      title: title ?? this.title,
      check: check ?? this.check,
      priority: priority ?? this.priority,
      deadlineDate: deadlineDate ?? this.deadlineDate,
      deadlineTime: deadlineTime ?? this.deadlineTime,
      subtask: subtask ?? this.subtask,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (listId.present) {
      map['list_id'] = Variable<String>(listId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (check.present) {
      map['check'] = Variable<bool>(check.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (deadlineDate.present) {
      map['deadline_date'] = Variable<DateTime>(deadlineDate.value);
    }
    if (deadlineTime.present) {
      map['deadline_time'] = Variable<DateTime>(deadlineTime.value);
    }
    if (subtask.present) {
      map['subtask'] = Variable<String>(subtask.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('listId: $listId, ')
          ..write('title: $title, ')
          ..write('check: $check, ')
          ..write('priority: $priority, ')
          ..write('deadlineDate: $deadlineDate, ')
          ..write('deadlineTime: $deadlineTime, ')
          ..write('subtask: $subtask, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _listIdMeta = const VerificationMeta('listId');
  @override
  late final GeneratedColumn<String> listId = GeneratedColumn<String>(
      'list_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _checkMeta = const VerificationMeta('check');
  @override
  late final GeneratedColumn<bool> check =
      GeneratedColumn<bool>('check', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("check" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _deadlineDateMeta =
      const VerificationMeta('deadlineDate');
  @override
  late final GeneratedColumn<DateTime> deadlineDate = GeneratedColumn<DateTime>(
      'deadline_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _deadlineTimeMeta =
      const VerificationMeta('deadlineTime');
  @override
  late final GeneratedColumn<DateTime> deadlineTime = GeneratedColumn<DateTime>(
      'deadline_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _subtaskMeta =
      const VerificationMeta('subtask');
  @override
  late final GeneratedColumn<String> subtask = GeneratedColumn<String>(
      'subtask', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        listId,
        title,
        check,
        priority,
        deadlineDate,
        deadlineTime,
        subtask,
        description
      ];
  @override
  String get aliasedName => _alias ?? 'tasks';
  @override
  String get actualTableName => 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('list_id')) {
      context.handle(_listIdMeta,
          listId.isAcceptableOrUnknown(data['list_id']!, _listIdMeta));
    } else if (isInserting) {
      context.missing(_listIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('check')) {
      context.handle(
          _checkMeta, check.isAcceptableOrUnknown(data['check']!, _checkMeta));
    } else if (isInserting) {
      context.missing(_checkMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('deadline_date')) {
      context.handle(
          _deadlineDateMeta,
          deadlineDate.isAcceptableOrUnknown(
              data['deadline_date']!, _deadlineDateMeta));
    }
    if (data.containsKey('deadline_time')) {
      context.handle(
          _deadlineTimeMeta,
          deadlineTime.isAcceptableOrUnknown(
              data['deadline_time']!, _deadlineTimeMeta));
    }
    if (data.containsKey('subtask')) {
      context.handle(_subtaskMeta,
          subtask.isAcceptableOrUnknown(data['subtask']!, _subtaskMeta));
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      listId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}list_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      check: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}check'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      deadlineDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline_date']),
      deadlineTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline_time']),
      subtask: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subtask']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TaskListsTable taskLists = $TaskListsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final TaskListsDao taskListsDao = TaskListsDao(this as AppDatabase);
  late final TasksDao tasksDao = TasksDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskLists, tasks];
}
