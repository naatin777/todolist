import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/presentation/providers/task_list_provider.dart';
import 'package:todolist/utils.dart';

class AddNewTaskList extends StatelessWidget {
  const AddNewTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.add),
      title: const Text("Add new list"),
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) => const AddNewTaskListDialog(),
        );
      },
    );
  }
}

class AddNewTaskListDialog extends ConsumerStatefulWidget {
  const AddNewTaskListDialog({super.key});

  @override
  ConsumerState<AddNewTaskListDialog> createState() =>
      _AddNewTaskListDialogState();
}

class _AddNewTaskListDialogState extends ConsumerState<AddNewTaskListDialog> {
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void onPositive() {
    ref
        .read(taskListProvider)
        .addTaskList(TaskList(id: uuid.v4(), title: titleController.text));
    Navigator.of(context).pop();
  }

  void onNegative() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add new list"),
      content: TextField(
        controller: titleController,
        autofocus: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Title',
        ),
        onSubmitted: (value) {
          onPositive();
        },
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        TextButton(
          onPressed: () {
            onNegative();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            onPositive();
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
