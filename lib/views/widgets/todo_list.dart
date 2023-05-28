import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/view_models/launch_screen_notifier.dart';

/// todoリストウェジェット
class todoList extends ConsumerWidget {
  final dynamic showDeleteDialog;
  final dynamic showEditDialog;

  const todoList(
      {Key? key, required this.showDeleteDialog, required this.showEditDialog})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launchScreenState = ref.watch(launchScreenProvider);

    return ListView.builder(
        itemCount: launchScreenState.todos.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                title: Text(launchScreenState.todos[index].title),
                subtitle: Text(launchScreenState.todos[index].description),
                trailing: Wrap(children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showEditDialog(todo: launchScreenState.todos[index]);
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
