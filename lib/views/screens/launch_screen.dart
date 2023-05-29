import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/models/todo.dart';
import 'package:todo_app_flutter/util/common.dart';
import 'package:todo_app_flutter/view_models/launch_screen_notifier.dart';
import 'package:todo_app_flutter/views/widgets/dialogs/dialog_delete.dart';
import 'package:todo_app_flutter/views/widgets/dialogs/dialog_edit.dart';
import 'package:todo_app_flutter/views/widgets/todo_list.dart';

class LaunchScreen extends ConsumerWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launchScreenState = ref.watch(launchScreenProvider);
    final launchScreenNotifier = ref.watch(launchScreenProvider.notifier);

    showDeleteDialog({required Todo todo}) {
      showDialog(
        context: context,
        builder: (_) => DialogDelete(context: context),
      ).then((value) async {
        if (value) {
          await launchScreenNotifier.deleteTodoById(todo.id);
          await launchScreenNotifier.fetchTodos();
        }
      });
    }

    showEditDialog({Todo? todo}) {
      showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              elevation: 5,
              builder: (_) => DialogEdit(context: context, todo: todo))
          .then((value) async {
        if (value != null) {
          // nullではない場合は追加または更新する
          await launchScreenNotifier.addOrUpdateTodo(value);
          await launchScreenNotifier.fetchTodos();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOリスト'),
        backgroundColor: Common.themeColor,
      ),
      body: launchScreenState.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : todoList(
              showDeleteDialog: showDeleteDialog,
              showEditDialog: showEditDialog),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showEditDialog();
          }),
    );
  }
}
