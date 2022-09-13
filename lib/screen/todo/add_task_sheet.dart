import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/providers/task_provider.dart';
import 'package:todolist/providers/todo_navigation_provider.dart';

class AddTaskSheet extends ConsumerStatefulWidget {
  const AddTaskSheet({super.key});

  @override
  ConsumerState<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends ConsumerState<AddTaskSheet> {
  final titleController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskList = ref.watch(todoNavigationProvider) ?? defaultTaskList;
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 8,
        top: 8,
        right: 8,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(
                child: TextField(
                  controller: titleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () {
                  ref
                      .read(taskDatabaseProvider)
                      .insertTask(taskList.id, titleController.text, false);
                  titleController.clear();
                },
                child: const Text("Save"),
              )
            ],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("Deadline"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.repeat),
            title: const Text("Repeat"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text("Subtasks"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
