import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/providers/home_navigation_provider.dart';
import 'package:todolist/presentation/providers/multi_select_provider.dart';
import 'package:todolist/presentation/providers/todo_body_provider.dart';
import 'package:todolist/presentation/providers/task_list_navigation_provider.dart';

class TodoBody extends ConsumerWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeScreen = ref.watch(homeNavigationProvider);
    if (homeScreen == HomeScreen.todo) {
      final taskList = ref.watch(taskListNavigationProvider);
      final tasks = ref.watch(tasksProvider(taskList));
      return tasks.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(data[index].id),
              background: Container(color: Colors.blue),
              secondaryBackground: Container(color: Colors.red),
              onDismissed: (direction) {
                ref.read(todoBodyProvider).removeTask(data[index]);
              },
              child: ListTile(
                leading: Checkbox(
                  value: data[index].check,
                  onChanged: (value) {
                    ref
                        .read(todoBodyProvider)
                        .changeTaskCheck(data[index], value);
                  },
                  activeColor: Colors.transparent,
                ),
                title: Text(
                  data[index].title,
                  style: TextStyle(
                    decoration: data[index].check
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                subtitle: Text(
                  data[index].description,
                  style: TextStyle(
                      decoration: data[index].check
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                onTap: () {},
                onLongPress: () {
                  ref.read(multiSelectProvider.notifier).enable();
                },
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              ),
            );
          },
        ),
        error: (error, stackTrace) => const SizedBox(),
        loading: () => const SizedBox(),
      );
    } else {
      return const SizedBox();
    }
  }
}
