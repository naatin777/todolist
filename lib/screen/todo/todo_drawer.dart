import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/task_list_provider.dart';

class TodoDrawer extends ConsumerWidget {
  TodoDrawer({Key? key}) : super(key: key);
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);
    final taskListTile = (taskList.value ?? []).map(
      (e) => ListTile(
        leading: const Icon(Icons.list),
        title: Text(e.title),
        onTap: () {},
      ),
    );
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.today),
              title: const Text("Today"),
              onTap: () {},
            ),
            const Divider(),
            for (ListTile tile in taskListTile) tile,
            if (taskListTile.isNotEmpty) const Divider(),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add new list"),
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Add new list"),
                      content: TextField(
                        controller: titleController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'List title',
                        ),
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
                                .read(taskListDatabaseProvider)
                                .insertTaskList(titleController.text);
                            titleController.clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text("Ok"),
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
