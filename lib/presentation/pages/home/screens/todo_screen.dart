import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/presentation/pages/home/components/add_new_task_fab.dart';
import 'package:todolist/presentation/providers/router_provider.dart';
import 'package:todolist/presentation/providers/task_list_provider.dart';
import 'package:todolist/presentation/providers/task_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listId = ref.watch(listIdProvider);
    final taskList = ref.watch(taskListStreamProvider(listId));
    final tasks = ref.watch(tasksFromListIdStreamProvider(listId));
    return CustomScrollView(
      slivers: [
        if (listId == inbox.id)
          SliverAppBar(
            floating: true,
            title: Text(inbox.title),
          )
        else
          taskList.when(
            data: (data) => SliverAppBar(
              floating: true,
              title: Text(data.title),
            ),
            loading: () => const SliverAppBar(),
            error: (error, stackTrace) => SliverAppBar(
              title: Text(error.toString()),
            ),
          ),
        tasks.when(
          data: (data) => SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final description = data[index].description;
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  leading: Checkbox(
                    value: data[index].check,
                    onChanged: (value) {
                      ref
                          .read(taskProvider)
                          .updateTask(data[index].copyWith(check: value));
                    },
                    fillColor: MaterialStateProperty.all(() {
                      switch (Priority.values[data[index].priority]) {
                        case Priority.critical:
                          return Colors.red;
                        case Priority.high:
                          return Colors.yellow;
                        case Priority.medium:
                          return Colors.blue;
                        default:
                          return Colors.grey;
                      }
                    }()),
                  ),
                  title: Text(data[index].title),
                  subtitle: description == null || description.isEmpty
                      ? null
                      : Text(description),
                  onTap: () {
                    GoRouter.of(context)
                        .push(createDetailRoute(data[index].id));
                  },
                );
              },
              childCount: data.length,
            ),
          ),
          loading: () => const SliverPadding(
            padding: EdgeInsets.all(0),
          ),
          error: (error, stackTrace) => const SliverPadding(
            padding: EdgeInsets.all(0),
          ),
        ),
        const SliverPadding(
          padding: EdgeInsets.all(50),
        ),
      ],
    );
  }
}
