import 'package:flutter/material.dart';
import 'package:todolist/presentation/pages/home/components/todo/add_new_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoFab extends StatelessWidget {
  const TodoFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return FloatingActionButton(
      tooltip: appLocalizations!.add_new_tasks,
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
                child: const AddNewTask(),
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
