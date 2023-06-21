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
    final LaunchScreenNotifier launchScreenNotifier =
        ref.watch(launchScreenProvider.notifier);

    return ListView.builder(
        itemCount: launchScreenState.todos.length,
        itemBuilder: (context, index) => Card(
              child: ListTile(
                tileColor: launchScreenState.todos[index].isCompleted == 1
                    ? Colors.grey[300]
                    : Colors.blue[50],
                leading: Checkbox(
                    value: launchScreenState.todos[index].isCompleted == 1,
                    onChanged: (bool? value) async {
                      final todo = launchScreenState.todos[index]
                          .copyWith(isCompleted: value! ? 1 : 0);
                      await launchScreenNotifier.addOrUpdateTodo(todo);
                      await launchScreenNotifier.fetchTodos();
                    }),
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
                      showDeleteDialog(todo: launchScreenState.todos[index]);
                    },
                  ),
                ]),
              ),
            ));
  }
}
