import 'package:flutter/material.dart';
import 'package:todolist/data/db/app_database.dart';

class Detail extends StatelessWidget {
  const Detail({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(task.title),
      ),
    );
  }
}
