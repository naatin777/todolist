import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/home_navigation_provider.dart';
import 'package:todolist/providers/task_provider.dart';

class TodoBody extends ConsumerWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listItem = ref.watch(taskProvider);
    final homeNavigation = ref.watch(homeNavigationProvider);
    if (homeNavigation == NavigationItem.todo) {
      return listItem.when(
        data: (data) => ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(data[index].toString()),
              background: Container(color: Colors.blue),
              secondaryBackground: Container(color: Colors.red),
              onDismissed: (direction) {},
              child: ListTile(
                leading: Checkbox(
                  value: data[index].check,
                  onChanged: (value) {
                    ref.read(taskDatabaseProvider).updateTask(
                          data[index],
                          data[index].list,
                          data[index].title,
                          value ?? data[index].check,
                        );
                  },
                  activeColor: Colors.transparent,
                ),
                title: Text(data[index].title),
                subtitle: const Text("subtitle"),
                onTap: () {},
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
