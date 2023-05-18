import 'package:flutter/material.dart';

/// todoリストウェジェット
class todoList extends StatelessWidget {
  const todoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text('タイトル'),
                subtitle: Text('説明'),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ),
            ));
  }
}
