import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/presentation/pages/home/components/todo/todo_app_bar.dart';
import 'package:todolist/presentation/providers/app_navigation_provider.dart';
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
          TodoAppBar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (multiSelect.isSelect) {
                  return MultiListTile(task: data[index]);
                } else {
                  return SingleListTile(task: data[index]);
                }
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

class MultiListTile extends ConsumerWidget {
  const MultiListTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final select = ref.watch(multiSelectProvider.select((value) => value.item));
    return ListTile(
      key: Key(task.id),
      leading: Transform.scale(
        scale: 1.1,
        child: Checkbox(
          value: task.check,
          onChanged: (value) {
            ref.read(todoBodyProvider.notifier).changeTaskCheck(task, value);
          },
          activeColor: Colors.transparent,
        ),
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration:
              task.check ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: task.description.isEmpty
          ? null
          : Text(
              task.description,
              style: TextStyle(
                decoration: task.check
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
      onTap: () {
        ref.read(multiSelectProvider.notifier).selectTask(task.id);
      },
      selected: select.contains(task.id),
      selectedColor: Theme.of(context).colorScheme.onSurfaceVariant,
      selectedTileColor: Theme.of(context).colorScheme.surfaceVariant,
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
    );
  }
}

class SingleListTile extends ConsumerWidget {
  const SingleListTile({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(task.id),
      background: Container(color: Colors.blue),
      secondaryBackground: Container(color: Colors.red),
      onDismissed: (direction) {
        ref.read(todoBodyProvider.notifier).removeTask(task);
      },
      child: ListTile(
        leading: Transform.scale(
          scale: 1.1,
          child: Checkbox(
            value: task.check,
            onChanged: (value) {
              ref.read(todoBodyProvider.notifier).changeTaskCheck(task, value);
            },
            activeColor: Colors.transparent,
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration:
                task.check ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        subtitle: task.description.isEmpty
            ? null
            : Text(
                task.description,
                style: TextStyle(
                  decoration: task.check
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
        onTap: () {
          GoRouter.of(context).push("/detail/${task.id}");
        },
        onLongPress: () {
          ref.read(multiSelectProvider.notifier).enable();
          ref.read(multiSelectProvider.notifier).selectTask(task.id);
        },
        horizontalTitleGap: 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      ),
    );
  }
}
