import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/providers/todo_navigation_provider.dart';

class TodoAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(todoNavigationProvider) ?? defaultTaskList;
    return AppBar(
      centerTitle: true,
      title: Text(taskList.title),
    );
  }
}
