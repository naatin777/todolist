import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/presentation/providers/multi_select_provider.dart';
import 'package:todolist/presentation/providers/task_list_provider.dart';

class TodoAppBar extends ConsumerWidget {
  const TodoAppBar({Key? key, required this.listId}) : super(key: key);
  final String listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final multiSelect = ref.watch(multiSelectProvider);
    final taskList = ref.watch(taskListFutureProvider(listId));
    return taskList.when(
      data: (data) => multiSelect.isSelect
          ? SliverAppBar(
              forceElevated: true,
              pinned: true,
              leading: IconButton(
                onPressed: () {
                  ref.read(multiSelectProvider.notifier).disable();
                },
                icon: const Icon(Icons.close),
              ),
              title: Text(multiSelect.item.length.toString()),
            )
          : SliverAppBar(
              floating: true,
              //  centerTitle: true,
              title: Text(data.title),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == "Delete") {
                      ref.read(taskListProvider).removeTaskList(listId);
                    }
                  },
                  itemBuilder: (context) {
                    return ["Delete"]
                        .map((e) => PopupMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList();
                  },
                ),
              ],
            ),
      error: (error, stackTrace) => const SliverAppBar(),
      loading: () => const SliverAppBar(),
    );
  }
}
