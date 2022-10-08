import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/presentation/providers/task_list_navigation_provider.dart';
import 'package:todolist/presentation/pages/home/components/todo/new_list_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoDrawer extends ConsumerWidget {
  const TodoDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskLists = ref.watch(taskListsProvider);
    final appLocalizations = AppLocalizations.of(context);
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.today),
              title: Text(today.title),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.inbox),
              title: Text(inbox.title),
              onTap: () {
                ref
                    .read(taskListNavigationProvider.notifier)
                    .changeTaskList(inbox);
                Navigator.of(context).pop();
              },
            ),
            const Divider(),
            taskLists.when(
              data: (data) {
                return Column(
                  children: [
                    for (TaskList taskList in data)
                      ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(taskList.title),
                        onTap: () {
                          ref
                              .read(taskListNavigationProvider.notifier)
                              .changeTaskList(taskList);
                          Navigator.of(context).pop();
                        },
                      ),
                    if (data.isNotEmpty) const Divider(),
                  ],
                );
              },
              error: (error, stackTrace) => const SizedBox(),
              loading: () => const SizedBox(),
            ),
            ListTile(
              leading: const Icon(Icons.add),
              title: Text(appLocalizations!.add_new_list),
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
