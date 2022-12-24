import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todolist/constant.dart';
import 'package:todolist/data/db/app_database.dart';
import 'package:todolist/presentation/providers/add_new_step_provider.dart';
import 'package:todolist/presentation/providers/add_new_task_provider.dart';
import 'package:todolist/presentation/providers/deadline_provider.dart';
import 'package:todolist/presentation/providers/task_list_provider.dart';

class AddNewTaskFab extends StatelessWidget {
  const AddNewTaskFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            final size = MediaQuery.of(context).size;
            final viewInsets = MediaQuery.of(context).viewInsets;
            final preferredSize = AppBar().preferredSize;
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: size.height - preferredSize.height,
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 8,
                  top: 8,
                  right: 8,
                  bottom: viewInsets.bottom,
                ),
                child: const AddNewTaskBottomSheet(),
              ),
            );
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          isScrollControlled: true,
        );
      },
    );
  }
}

class AddNewTaskBottomSheet extends ConsumerStatefulWidget {
  const AddNewTaskBottomSheet({super.key});

  @override
  ConsumerState<AddNewTaskBottomSheet> createState() =>
      _AddNewTaskBottomSheetState();
}

class _AddNewTaskBottomSheetState extends ConsumerState<AddNewTaskBottomSheet> {
  final titleController = TextEditingController();
  final titleFocusNode = FocusNode();
  final descriptionController = TextEditingController();
  final descriptionFocusNode = FocusNode();

  void done() async {
    if (titleController.text.isNotEmpty) {
      await ref
          .read(addNewTaskProvider.notifier)
          .addTask(titleController.text, descriptionController.text);
      ref.read(addNewTaskProvider.notifier).reset();
      titleController.clear();
      descriptionController.clear();
      titleFocusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    titleFocusNode.dispose();
    descriptionController.dispose();
    descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addNewTask = ref.watch(addNewTaskProvider);
    final listId = ref.watch(taskListFutureProvider(addNewTask.listId));
    final deadlineChip = ref.watch(deadlineChipProvider);
    final addNewStep = ref.watch(addNewStepProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: TextField(
                controller: titleController,
                focusNode: titleFocusNode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                ),
                onChanged: (value) {
                  ref.read(addNewTaskProvider.notifier).changeTitle(value);
                },
                textInputAction: TextInputAction.done,
                style: const TextStyle(fontSize: 20),
                autofocus: true,
                autocorrect: false,
                onEditingComplete: () {
                  done();
                },
              ),
            ),
            IconButton(
              onPressed: titleController.text.isEmpty
                  ? null
                  : () {
                      done();
                    },
              icon: const Icon(Icons.send),
            )
          ],
        ),
        if (addNewTask.description != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: descriptionController,
              focusNode: descriptionFocusNode,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Description",
              ),
              onChanged: (value) {
                ref.read(addNewTaskProvider.notifier).changeDescription(value);
              },
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
          ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  child: listId.when(
                    data: (data) => Row(
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
                          const TaskListSelectionBottomSheet(),
                    );
                  },
                ),
              ),
              if (addNewTask.priority != 3)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ActionChip(
                    label: Text("p${addNewTask.priority + 1}"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const PrioritySelectionDialog(),
                      );
                    },
                  ),
                ),
              if (deadlineChip != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InputChip(
                    label: Text(deadlineChip),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const DeadlineDialog(),
                      );
                    },
                    onDeleted: () {
                      ref
                          .read(addNewTaskProvider.notifier)
                          .changeDateTime(null, null);
                    },
                  ),
                ),
              if (addNewStep.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ActionChip(
                    label: Text("${addNewStep.length} steps"),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AddNewStepDialog(),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom + 4.0,
          ),
          child: Row(
            children: [
              IconButton(
                tooltip: "priority",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const PrioritySelectionDialog(),
                  );
                },
                icon: const Icon(Icons.priority_high),
              ),
              IconButton(
                tooltip: "deadline",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const DeadlineDialog(),
                  );
                },
                icon: const Icon(Icons.calendar_month),
              ),
              // IconButton(
              //   tooltip: "subtask",
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) => const AddNewStepDialog(),
              //     );
              //   },
              //   icon: const Icon(Icons.add_task),
              // ),
              IconButton(
                tooltip: "description",
                onPressed: () {
                  ref.read(addNewTaskProvider.notifier).changeDescription("");
                  descriptionFocusNode.requestFocus();
                },
                icon: const Icon(Icons.article),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TaskListSelectionBottomSheet extends ConsumerWidget {
  const TaskListSelectionBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addNewTask = ref.watch(addNewTaskProvider);
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
                ref.read(addNewTaskProvider.notifier).changeListId(inbox.id);
                Navigator.of(context).pop();
              },
              selected: addNewTask.listId == inbox.id,
            ),
            const Divider(
              height: 0,
            ),
            for (TaskList taskList in data)
              ListTile(
                leading: const Icon(Icons.list),
                title: Text(taskList.title),
                onTap: () {
                  ref
                      .read(addNewTaskProvider.notifier)
                      .changeListId(taskList.id);
                  Navigator.of(context).pop();
                },
                selected: addNewTask.listId == taskList.id,
              ),
          ],
        ),
      ),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const SizedBox(),
    );
  }
}

class PrioritySelectionDialog extends ConsumerWidget {
  const PrioritySelectionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addNewTask = ref.watch(addNewTaskProvider);
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 24),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: Priority.values.map((e) {
          return ListTile(
            leading: Icon(
              Icons.priority_high,
              color: e.color,
            ),
            title: Text("P${(e.index + 1)}"),
            trailing: Radio(
              value: e,
              groupValue: Priority.values[addNewTask.priority],
              onChanged: (value) {
                ref.read(addNewTaskProvider.notifier).changePriority(e.index);
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              ref.read(addNewTaskProvider.notifier).changePriority(e.index);
              Navigator.of(context).pop();
            },
          );
        }).toList(),
      ),
    );
  }
}

enum Priority {
  critical(Colors.red),
  high(Colors.yellow),
  medium(Colors.blue),
  low(null);

  final Color? color;

  const Priority(this.color);
}

class DeadlineDialog extends ConsumerStatefulWidget {
  const DeadlineDialog({super.key});

  @override
  ConsumerState<DeadlineDialog> createState() => _DeadlineDialogState();
}

class _DeadlineDialogState extends ConsumerState<DeadlineDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final date =
          ref.watch(addNewTaskProvider.select((value) => value.deadlineDate));
      final time =
          ref.watch(addNewTaskProvider.select((value) => value.deadlineTime));
      ref.read(deadlineProvider.notifier).changeDateTime(date);
      ref
          .read(deadlineProvider.notifier)
          .changeTimeOfDay(time != null ? TimeOfDay.fromDateTime(time) : null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final deadline = ref.watch(deadlineProvider);
    final dateTime = deadline.dateTime;
    final timeOfDay = deadline.timeOfDay;
    final dateFormat = DateFormat('yyyy-MM-dd');
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text("Date"),
            onTap: () async {
              final now = DateTime.now();
              final result = await showDatePicker(
                context: context,
                initialDate: deadline.dateTime ?? now,
                firstDate: DateTime(now.year - 100),
                lastDate: DateTime(now.year + 100),
              );
              ref.read(deadlineProvider.notifier).changeDateTime(result);
            },
            subtitle:
                dateTime != null ? Text(dateFormat.format(dateTime)) : null,
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text("Time"),
            onTap: () async {
              final now = TimeOfDay.now();
              final result = await showTimePicker(
                context: context,
                initialTime: now,
              );
              ref.read(deadlineProvider.notifier).changeTimeOfDay(result);
            },
            subtitle:
                timeOfDay != null ? Text(timeOfDay.format(context)) : null,
            enabled: deadline.dateTime != null,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            ref.read(deadlineProvider.notifier).clear();
          },
          child: const Text("Clear"),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref
                    .read(addNewTaskProvider.notifier)
                    .changeDateTime(dateTime, timeOfDay);
              },
              child: const Text("OK"),
            ),
          ],
        )
      ],
    );
  }
}

class AddNewStepDialog extends ConsumerStatefulWidget {
  const AddNewStepDialog({super.key});

  @override
  ConsumerState<AddNewStepDialog> createState() => _AddNewStepDialogState();
}

class _AddNewStepDialogState extends ConsumerState<AddNewStepDialog> {
  final List<TextEditingController> controllers = [];

  void addNewStep() {
    controllers.add(TextEditingController());
    ref.read(addNewStepProvider.notifier).insertStep("");
  }

  void removeStep(int index, String id) {
    controllers.removeAt(index);
    ref.read(addNewStepProvider.notifier).removeStep(id);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final steps = ref.watch(addNewStepProvider);
      for (final step in steps) {
        controllers.add(TextEditingController(text: step.title));
      }
      if (steps.isEmpty) {
        addNewStep();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final steps = ref.watch(addNewStepProvider);
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        for (int i = 0; i < controllers.length; i++)
          ListTile(
            title: TextField(
              controller: controllers[i],
              onChanged: (value) {
                ref
                    .read(addNewStepProvider.notifier)
                    .changeTitle(steps[i].id, steps[i].title);
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Input the title",
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                removeStep(i, steps[i].id);
              },
              icon: const Icon(Icons.close),
            ),
          ),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text("Add new step"),
          onTap: () {
            addNewStep();
          },
        )
      ],
    );
  }
}
