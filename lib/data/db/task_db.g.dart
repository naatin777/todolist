// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_db.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String list;
  final String title;
  final bool check;
  const Task(
      {required this.id,
      required this.list,
      required this.title,
      required this.check});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['list'] = Variable<String>(list);
    map['title'] = Variable<String>(title);
    map['check'] = Variable<bool>(check);
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      list: Value(list),
      title: Value(title),
      check: Value(check),
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
    };
  }

  Task copyWith({String? id, String? list, String? title, bool? check}) => Task(
        id: id ?? this.id,
        list: list ?? this.list,
        title: title ?? this.title,
        check: check ?? this.check,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('list: $list, ')
          ..write('title: $title, ')
          ..write('check: $check')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, list, title, check);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.list == this.list &&
          other.title == this.title &&
          other.check == this.check);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> list;
  final Value<String> title;
  final Value<bool> check;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.list = const Value.absent(),
    this.title = const Value.absent(),
    this.check = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String list,
    required String title,
    required bool check,
  })  : list = Value(list),
        title = Value(title),
        check = Value(check);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? list,
    Expression<String>? title,
    Expression<bool>? check,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (list != null) 'list': list,
      if (title != null) 'title': title,
      if (check != null) 'check': check,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? id,
      Value<String>? list,
      Value<String>? title,
      Value<bool>? check}) {
    return TasksCompanion(
      id: id ?? this.id,
      list: list ?? this.list,
      title: title ?? this.title,
      check: check ?? this.check,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('list: $list, ')
          ..write('title: $title, ')
          ..write('check: $check')
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
  @override
  List<GeneratedColumn> get $columns => [id, list, title, check];
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
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

abstract class _$TaskDatabase extends GeneratedDatabase {
  _$TaskDatabase(QueryExecutor e) : super(e);
  late final $TasksTable tasks = $TasksTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tasks];
}
