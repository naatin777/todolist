import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/providers/navigation_provider.dart';

class TodoBody extends ConsumerWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listItem = List.generate(50, (index) => index);
    final navigationIndex = ref.watch(navigationProvider);
    if (navigationIndex == NavigationItem.todo) {
      return ListView.separated(
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(listItem[index].toString()),
            background: Container(color: Colors.blue),
            secondaryBackground: Container(color: Colors.red),
            onDismissed: (direction) {},
            child: ListTile(
              leading: Checkbox(
                value: false,
                onChanged: (value) {},
                activeColor: Colors.transparent,
              ),
              title: Text("${listItem[index]}"),
              subtitle: const Text("subtitle"),
              onTap: () {},
              horizontalTitleGap: 0,
              contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container();
        },
      );
    } else {
      return Container();
    }
  }
}
