import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/domain/models/new_task_model.dart';
import 'package:todolist/presentation/providers/new_task_provider.dart';
import 'package:todolist/presentation/providers/task_list_provider.dart';

class NewTask extends ConsumerStatefulWidget {
  const NewTask({super.key});

  @override
  ConsumerState<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends ConsumerState<NewTask> {
  final _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskLists = ref.watch(taskListsStreamProvider);
    final list = ref.watch(newTaskProvider.select((value) => value.listId));
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                ),
                textInputAction: TextInputAction.send,
                style: const TextStyle(fontSize: 20),
                autofocus: true,
                autocorrect: false,
                onChanged: (value) {
                  ref.read(newTaskProvider.notifier).changeTitle(value);
                },
                onSubmitted: (value) {
                  ref.read(newTaskProvider.notifier).addTask(_titleController);
                },
                onEditingComplete: () {
                  FocusScope.of(context).requestFocus();
                },
              ),
            ),
            IconButton(
              onPressed: () {
                ref.read(newTaskProvider.notifier).addTask(_titleController);
              },
              icon: const Icon(Icons.send),
            )
          ],
        ),
        taskLists.when(
          data: (value) => DropdownButton<String>(
            items: [
              DropdownMenuItem(
                value: inbox.id,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(inbox.title),
                ),
              ),
              for (TaskList taskList in value)
                DropdownMenuItem(
                  value: taskList.id,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(taskList.title),
                  ),
                ),
            ],
            value: list,
            onChanged: (value) {
              ref.read(newTaskProvider.notifier).changeList(value ?? inbox.id);
            },
            isExpanded: true,
          ),
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const SizedBox(),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 4.0,
            bottom: MediaQuery.of(context).padding.bottom + 4.0,
          ),
          child: Row(
            children: [
              IconButton(
                tooltip: "priority",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const PriorityDialog();
                    },
                  );
                },
                icon: const Icon(Icons.priority_high),
              ),
              IconButton(
                tooltip: "deadline",
                onPressed: () async {
                  // final now = DateTime.now();
                  // final date = await showDatePicker(
                  //   context: context,
                  //   initialDate: now,
                  //   firstDate: DateTime(now.year - 100),
                  //   lastDate: DateTime(now.year + 100),
                  // );
                  // final time = await showTimePicker(
                  //   context: context,
                  //   initialTime: TimeOfDay.fromDateTime(now),
                  // );
                  // ref
                  //     .read(newTaskProvider.notifier)
                  //     .changeDateTime(date, time);
                },
                icon: const Icon(Icons.calendar_month),
              ),
              IconButton(
                tooltip: "subtask",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const SubTaskDialog();
                    },
                  );
                },
                icon: const Icon(Icons.add_task),
              ),
              IconButton(
                tooltip: "description",
                onPressed: () {},
                icon: const Icon(Icons.article),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PriorityDialog extends ConsumerWidget {
  const PriorityDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priority = ref.watch(
      newTaskProvider.select((value) => value.priority),
    );
    return SimpleDialog(
      children: Priority.values.map((e) {
        return ListTile(
          leading: Icon(
            Icons.priority_high,
            color: e.color,
          ),
          title:
              Text("${e.name[0].toUpperCase() + e.name.substring(1)} Priority"),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          onTap: () {
            ref.read(newTaskProvider.notifier).changePriority(e);
            Navigator.of(context).pop();
          },
          selected: priority == e,
        );
      }).toList(),
    );
  }
}

class SubTaskDialog extends ConsumerStatefulWidget {
  const SubTaskDialog({super.key});

  @override
  ConsumerState<SubTaskDialog> createState() => _SubTaskDialogState();
}

class _SubTaskDialogState extends ConsumerState<SubTaskDialog> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subTask = ref.watch(newTaskProvider).subtask;
    return SimpleDialog(
      title: const Text("Subtask"),
      contentPadding: const EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 16.0),
      children: [
        TextField(
          controller: _titleController,
          onSubmitted: (value) {
            ref
                .read(newTaskProvider.notifier)
                .addSubtask(_titleController.text);
            _titleController.clear();
          },
        ),
        for (int i = 0; i < subTask.length; i++)
          ListTile(
            title: Text(subTask[i]),
            trailing: IconButton(
              onPressed: () {
                ref.read(newTaskProvider.notifier).removeSubtask(i);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
      ],
    );
  }
}

extension on Priority {
  Color get color {
    switch (this) {
      case Priority.high:
        return Colors.red;
      case Priority.medium:
        return Colors.yellow;
      case Priority.low:
        return Colors.blue;
      case Priority.no:
        return Colors.grey;
    }
  }
}
