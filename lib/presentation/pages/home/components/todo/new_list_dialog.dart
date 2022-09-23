import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/providers/todo_navigation_provider.dart';

class NewListDialog extends ConsumerStatefulWidget {
  const NewListDialog({Key? key}) : super(key: key);

  @override
  ConsumerState<NewListDialog> createState() => _NewListDialogState();
}

class _NewListDialogState extends ConsumerState<NewListDialog> {
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
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
          labelText: 'List title',
        ),
        onSubmitted: (value) {
          ref
              .read(todoNavigationProvider.notifier)
              .addTaskList(titleController.text);
          Navigator.of(context).pop();
        },
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(todoNavigationProvider.notifier)
                .addTaskList(titleController.text);
            Navigator.of(context).pop();
          },
          child: const Text("Ok"),
        ),
      ],
    );
  }
}
