import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/home_navigation_provider.dart';
import 'package:todolist/providers/multi_select_provider.dart';
import 'package:todolist/providers/todo_body_provider.dart';
import 'package:todolist/providers/todo_navigation_provider.dart';

class TodoBody extends ConsumerWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeNavigation = ref.watch(homeNavigationProvider);
    if (homeNavigation == NavigationItem.todo) {
      final todoNavigation = ref.watch(todoNavigationProvider);
      final tasks = ref.watch(tasksProvider(todoNavigation));
      return tasks.when(
        data: (data) => ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(data[index].id),
              background: Container(color: Colors.blue),
              secondaryBackground: Container(color: Colors.red),
              onDismissed: (direction) {
                ref.read(todoBodyProvider).deleteTask(data[index]);
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
                  "subtitle",
                  style: TextStyle(
                      decoration: data[index].check
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
                onTap: () {},
                onLongPress: () {
                  ref.read(multiSelectProvider.notifier).onSelect();
                },
                horizontalTitleGap: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Container();
          },
        ),
        error: (error, stackTrace) => Container(),
        loading: () => const CircularProgressIndicator(),
      );
    } else {
      return Container();
    }
  }
}
