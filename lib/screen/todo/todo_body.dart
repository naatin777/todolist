import 'package:flutter/material.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listItem = List.generate(50, (index) => index);
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
  }
}
