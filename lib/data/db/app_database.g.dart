// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

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
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
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
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  final VerificationMeta _titleMeta = const VerificationMeta('title');
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
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  TaskList map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskList(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
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
  final String list;
  final String title;
  final bool check;
  final DateTime? deadline;
  final String subtask;
  const Task(
      {required this.id,
      required this.list,
      required this.title,
      required this.check,
      this.deadline,
      required this.subtask});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['list'] = Variable<String>(list);
    map['title'] = Variable<String>(title);
    map['check'] = Variable<bool>(check);
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    map['subtask'] = Variable<String>(subtask);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      list: Value(list),
      title: Value(title),
      check: Value(check),
      deadline: deadline == null && nullToAbsent
          ? const Value.absent()
          : Value(deadline),
      subtask: Value(subtask),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      list: serializer.fromJson<String>(json['list']),
      title: serializer.fromJson<String>(json['title']),
      check: serializer.fromJson<bool>(json['check']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      subtask: serializer.fromJson<String>(json['subtask']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'list': serializer.toJson<String>(list),
      'title': serializer.toJson<String>(title),
      'check': serializer.toJson<bool>(check),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'subtask': serializer.toJson<String>(subtask),
    };
  }

  Task copyWith(
          {String? id,
          String? list,
          String? title,
          bool? check,
          Value<DateTime?> deadline = const Value.absent(),
          String? subtask}) =>
      Task(
        id: id ?? this.id,
        list: list ?? this.list,
        title: title ?? this.title,
        check: check ?? this.check,
        deadline: deadline.present ? deadline.value : this.deadline,
        subtask: subtask ?? this.subtask,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('list: $list, ')
          ..write('title: $title, ')
          ..write('check: $check, ')
          ..write('deadline: $deadline, ')
          ..write('subtask: $subtask')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, list, title, check, deadline, subtask);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.list == this.list &&
          other.title == this.title &&
          other.check == this.check &&
          other.deadline == this.deadline &&
          other.subtask == this.subtask);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> list;
  final Value<String> title;
  final Value<bool> check;
  final Value<DateTime?> deadline;
  final Value<String> subtask;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.list = const Value.absent(),
    this.title = const Value.absent(),
    this.check = const Value.absent(),
    this.deadline = const Value.absent(),
    this.subtask = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String list,
    required String title,
    required bool check,
    this.deadline = const Value.absent(),
    required String subtask,
  })  : list = Value(list),
        title = Value(title),
        check = Value(check),
        subtask = Value(subtask);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? list,
    Expression<String>? title,
    Expression<bool>? check,
    Expression<DateTime>? deadline,
    Expression<String>? subtask,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (list != null) 'list': list,
      if (title != null) 'title': title,
      if (check != null) 'check': check,
      if (deadline != null) 'deadline': deadline,
      if (subtask != null) 'subtask': subtask,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? list,
      Value<String>? title,
      Value<bool>? check,
      Value<DateTime?>? deadline,
      Value<String>? subtask}) {
    return TasksCompanion(
      id: id ?? this.id,
      list: list ?? this.list,
      title: title ?? this.title,
      check: check ?? this.check,
      deadline: deadline ?? this.deadline,
      subtask: subtask ?? this.subtask,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (list.present) {
      map['list'] = Variable<String>(list.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (check.present) {
      map['check'] = Variable<bool>(check.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (subtask.present) {
      map['subtask'] = Variable<String>(subtask.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('list: $list, ')
          ..write('title: $title, ')
          ..write('check: $check, ')
          ..write('deadline: $deadline, ')
          ..write('subtask: $subtask')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => uuid.v4());
  final VerificationMeta _listMeta = const VerificationMeta('list');
  @override
  late final GeneratedColumn<String> list = GeneratedColumn<String>(
      'list', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _checkMeta = const VerificationMeta('check');
  @override
  late final GeneratedColumn<bool> check = GeneratedColumn<bool>(
      'check', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("check" IN (0, 1))');
  final VerificationMeta _deadlineMeta = const VerificationMeta('deadline');
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
      'deadline', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _subtaskMeta = const VerificationMeta('subtask');
  @override
  late final GeneratedColumn<String> subtask = GeneratedColumn<String>(
      'subtask', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, list, title, check, deadline, subtask];
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
    }
    if (data.containsKey('list')) {
      context.handle(
          _listMeta, list.isAcceptableOrUnknown(data['list']!, _listMeta));
    } else if (isInserting) {
      context.missing(_listMeta);
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
    if (data.containsKey('deadline')) {
      context.handle(_deadlineMeta,
          deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta));
    }
    if (data.containsKey('subtask')) {
      context.handle(_subtaskMeta,
          subtask.isAcceptableOrUnknown(data['subtask']!, _subtaskMeta));
    } else if (isInserting) {
      context.missing(_subtaskMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      list: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}list'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      check: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}check'])!,
      deadline: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deadline']),
      subtask: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}subtask'])!,
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
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [taskLists, tasks];
}
