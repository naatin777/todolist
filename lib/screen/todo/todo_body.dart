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
          child: ListTile(
            leading: Checkbox(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              value: false,
              onChanged: (value) {},
            ),
            title: Text("${listItem[index]}"),
            subtitle: Text("subtitle"),
            onTap: () {},
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
          ),
          background: Container(color: Colors.blue),
          secondaryBackground: Container(color: Colors.red),
          onDismissed: (direction) {},
        );
      },
      separatorBuilder: (context, index) {
        return Container();
      },
    );
  }
}
