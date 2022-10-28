import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist/data/db/app_database.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.taskId});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: Text(taskId),
      ),
    );
  }
}
