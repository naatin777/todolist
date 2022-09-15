import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final taskList = ref.watch(todoNavigationProvider);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight:
            MediaQuery.of(context).size.height - AppBar().preferredSize.height,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 8,
          top: 8,
          right: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
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
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                    ),
                    style: const TextStyle(fontSize: 20),
                    autofocus: true,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(taskDatabaseProvider)
                        .insertTask(taskList.id, titleController.text, false);
                    titleController.clear();
                  },
                  icon: const Icon(Icons.send),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 4.0,
                bottom: MediaQuery.of(context).padding.bottom + 4.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    tooltip: "importance",
                    onPressed: () {},
                    icon: const Icon(Icons.star),
                  ),
                  IconButton(
                    tooltip: "memo",
                    onPressed: () {},
                    icon: const Icon(Icons.article),
                  ),
                  IconButton(
                    tooltip: "deadline",
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month),
                  ),
                  IconButton(
                    tooltip: "subtask",
                    onPressed: () {},
                    icon: const Icon(Icons.add_task),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
