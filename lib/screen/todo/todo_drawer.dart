import 'package:flutter/material.dart';

class TodoDrawer extends StatelessWidget {
  const TodoDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.today),
              title: const Text("Today"),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Add new task"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
