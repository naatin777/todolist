import 'package:flutter/material.dart';

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
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 8,
                top: 8,
                right: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Title"),
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Save"),
                      )
                    ],
                  ),
                  Divider(),
                  ListTile(
                    leading: const Icon(Icons.calendar_month),
                    title: const Text("Deadline"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.repeat),
                    title: const Text("Repeat"),
                    onTap: () {},
                  ),
                  Divider(),
                  ListTile(
                    leading: const Icon(Icons.check_box),
                    title: const Text("Subtasks"),
                    onTap: () {},
                  ),
                ],
              ),
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
