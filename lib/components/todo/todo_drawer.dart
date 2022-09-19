import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/providers/todo_navigation_provider.dart';
import 'package:todolist/components/todo/new_list_dialog.dart';

class TodoDrawer extends ConsumerWidget {
  const TodoDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskLists);
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.today),
              title: const Text("Today"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.inbox),
              title: Text(inbox.title),
              onTap: () {
                ref.read(todoNavigationProvider.notifier).changeTaskList(inbox);
                Navigator.of(context).pop();
              },
            ),
            const Divider(),
            taskList.when(
              data: (data) {
                return Column(
                  children: [
                    for (TaskList list in data)
                      ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(list.title),
                        onTap: () {
                          ref
                              .read(todoNavigationProvider.notifier)
                              .changeTaskList(list);
                          Navigator.of(context).pop();
                        },
                      ),
                    if (data.isNotEmpty) const Divider(),
                  ],
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container(),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add new list"),
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return const NewListDialog();
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
