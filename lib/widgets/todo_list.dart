import 'package:flutter/material.dart';

/// todoリストウェジェット
class todoList extends StatelessWidget {
  final dynamic showDeleteDialog;
  final dynamic showEditDialog;

  const todoList(
      {Key? key, required this.showDeleteDialog, required this.showEditDialog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text('タイトル'),
                subtitle: Text('説明'),
                trailing: Wrap(children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showEditDialog();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      showDeleteDialog();
                    },
                  ),
                ]),
              ),
            ));
  }
}
