import 'package:flutter/material.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TodoAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("Todo"),
    );
  }
}
