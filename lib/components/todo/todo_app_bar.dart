import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/multi_select_provider.dart';
import 'package:todolist/providers/todo_navigation_provider.dart';

class TodoAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(todoNavigationProvider);
    final multiSelect = ref.watch(multiSelectProvider);
    if (multiSelect) {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(multiSelectProvider.notifier).onDisable();
          },
          icon: const Icon(Icons.close),
        ),
      );
    } else {
      return AppBar(
        centerTitle: true,
        title: Text(taskList.title),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == "Delete") {
                ref
                    .read(todoNavigationProvider.notifier)
                    .deleteTaskList(taskList);
              }
            },
            itemBuilder: (context) {
              return ["Delete"]
                  .map(
                    (e) => PopupMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList();
            },
          ),
        ],
      );
    }
  }
}
