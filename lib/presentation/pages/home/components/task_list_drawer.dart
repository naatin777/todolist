import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/presentation/pages/home/components/add_new_task_list.dart';
import 'package:todolist/presentation/pages/home/home.dart';
import 'package:todolist/presentation/providers/router_provider.dart';
import 'package:todolist/presentation/providers/task_list_provider.dart';

class TaskListDrawer extends ConsumerWidget {
  const TaskListDrawer({Key? key}) : super(key: key);

  void navigate(BuildContext context, String listId) {
    GoRouter.of(context).go(createHomeRoute(NavigationItem.todo.index, listId));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTaskLists = ref.watch(allTaskListsStreamProvider);
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.inbox),
              title: Text(inbox.title),
              onTap: () {
                navigate(context, inbox.id);
              },
            ),
            const Divider(),
            allTaskLists.when(
              data: (data) => Column(
                children: [
                  for (TaskList taskList in data)
                    ListTile(
                      leading: const Icon(Icons.list),
                      title: Text(taskList.title),
                      onTap: () {
                        navigate(context, taskList.id);
                      },
                    ),
                  if (data.isNotEmpty) const Divider(),
                ],
              ),
              error: (error, stackTrace) => const SizedBox(),
              loading: () => const SizedBox(),
            ),
            const AddNewTaskList(),
          ],
        ),
      ),
    );
  }
}
