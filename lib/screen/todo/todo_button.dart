import 'package:flutter/material.dart';
import 'package:todolist/screen/todo/add_task_sheet.dart';

class TodoButton extends StatelessWidget {
  const TodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final preferredSize = AppBar().preferredSize;
    return FloatingActionButton(
      onPressed: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(8),
            ),
          ),
          constraints: BoxConstraints(
            maxHeight: mediaQuery.size.height - preferredSize.height,
            minHeight: mediaQuery.size.height - preferredSize.height,
          ),
          context: context,
          builder: (context) {
            return const AddTaskSheet();
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
