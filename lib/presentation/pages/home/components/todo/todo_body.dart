import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/providers/multi_select_provider.dart';
import 'package:todolist/presentation/providers/todo_body_provider.dart';
import 'package:todolist/presentation/providers/task_list_navigation_provider.dart';

class TodoBody extends ConsumerWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListNavigationProvider);
    final tasks = ref.watch(tasksProvider(taskList));
    final multiSelect = ref.watch(multiSelectProvider);
    return tasks.when(
      data: (data) => CustomScrollView(
        slivers: [
          if (multiSelect)
            SliverAppBar(
              forceElevated: true,
              pinned: true,
              leading: IconButton(
                onPressed: () {
                  ref.read(multiSelectProvider.notifier).disable();
                },
                icon: const Icon(Icons.close),
              ),
            )
          else
            SliverAppBar(
              floating: true,
              centerTitle: true,
              title: Text(taskList.title),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "Delete") {
                      ref
                          .read(taskListNavigationProvider.notifier)
                          .removeTaskList(taskList);
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
            ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Dismissible(
                  key: Key(data[index].id),
                  background: Container(color: Colors.blue),
                  secondaryBackground: Container(color: Colors.red),
                  onDismissed: (direction) {
                    ref.read(todoBodyProvider).removeTask(data[index]);
                  },
                  child: ListTile(
                    // shape: data[index].check
                    //     ? RoundedRectangleBorder(
                    //         side: BorderSide(
                    //             color: Theme.of(context).colorScheme.primary,
                    //             width: 0),
                    //         borderRadius: BorderRadius.circular(20),
                    //       )
                    //     : null,
                    leading: Transform.scale(
                      scale: 1.1,
                      child: Checkbox(
                        value: data[index].check,
                        onChanged: (value) {
                          ref
                              .read(todoBodyProvider)
                              .changeTaskCheck(data[index], value);
                        },
                        activeColor: Colors.transparent,
                      ),
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
                    selected: true,
                    selectedColor:
                        Theme.of(context).colorScheme.onSurfaceVariant,
                    selectedTileColor: data[index].check
                        ? Theme.of(context).colorScheme.surfaceVariant
                        : null,
                    horizontalTitleGap: 0,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  ),
                );
              },
              childCount: data.length,
            ),
          )
        ],
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
