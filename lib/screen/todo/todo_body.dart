import 'package:flutter/material.dart';

class TodoBody extends StatelessWidget {
  const TodoBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listItem = List.generate(50, (index) => index);
    return ListView.builder(
      itemCount: listItem.length,
      itemBuilder: (context, index) {
        return InkWell(
          key: Key(listItem[index].toString()),
          onTap: () {},
          child: Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              Text("${listItem[index]}")
            ],
          ),
        );
      },
    );
  }
}
