import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/presentation/providers/detail_provider.dart';
import 'package:todolist/presentation/providers/task_list_provider.dart';
import 'package:todolist/presentation/providers/task_provider.dart';

class Detail extends ConsumerWidget {
  const Detail({super.key, required this.taskId});

  final String? taskId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(tasksFromIdStreamProvider(taskId ?? ""));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
              ref.read(taskProvider).removeTask(taskId ?? "");
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: task.when(
        data: (data) {
          return Consumer(
            builder: (context, ref, child) {
              final titleController =
                  ref.watch(detailTitleProvider(data.title));
              final descriptionController =
                  ref.watch(detailDescriptionProvider(data.description ?? ""));
              final listId = ref.watch(taskListFutureProvider(data.listId));
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      child: listId.when(
                        data: (data) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              data.title,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                        loading: () => const SizedBox(),
                        error: (error, stackTrace) => const SizedBox(),
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              TaskListSelectionBottomSheet(listId: data.listId),
                        );
                      },
                    ),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Title",
                      ),
                      textInputAction: TextInputAction.done,
                      maxLines: null,
                      style: const TextStyle(fontSize: 24),
                      onSubmitted: (value) {
                        ref
                            .read(taskProvider)
                            .updateTask(data.copyWith(title: value));
                      },
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Description",
                      ),
                      maxLines: null,
                      onSubmitted: (value) {
                        ref.read(taskProvider).updateTask(
                            data.copyWith(description: drift.Value(value)));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        loading: () => const SizedBox(),
        error: (error, stackTrace) => const SizedBox(),
      ),
    );
  }
}

class TaskListSelectionBottomSheet extends ConsumerWidget {
  const TaskListSelectionBottomSheet({super.key, required this.listId});

  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTaskLists = ref.watch(allTaskListsStreamProvider);
    return allTaskLists.when(
      data: (data) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.inbox),
              title: Text(inbox.title),
              onTap: () {
                // ref.read(addNewTaskProvider.notifier).changeListId(inbox.id);
                Navigator.of(context).pop();
              },
              selected: listId == inbox.id,
            ),
            const Divider(
              height: 0,
            ),
            for (TaskList taskList in data)
              ListTile(
                leading: const Icon(Icons.list),
                title: Text(taskList.title),
                onTap: () {
                  // ref
                  //     .read(addNewTaskProvider.notifier)
                  //     .changeListId(taskList.id);
                  Navigator.of(context).pop();
                },
                selected: listId == taskList.id,
              ),
          ],
        ),
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}
