import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/models/todo.dart';
import 'package:todo_app_flutter/util/common.dart';
import 'package:todo_app_flutter/view_models/launch_screen_notifier.dart';
import 'package:todo_app_flutter/views/widgets/dialogs/dialog_delete.dart';
import 'package:todo_app_flutter/views/widgets/dialogs/dialog_edit.dart';
import 'package:todo_app_flutter/views/widgets/todo_list.dart';

class LaunchScreen extends ConsumerWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final launchScreenState = ref.watch(launchScreenProvider);
    final launchScreenNotifier = ref.watch(launchScreenProvider.notifier);

    showDeleteDialog() {
      showDialog(
        context: context,
        builder: (_) => DialogDelete(context: context, onPressed: () {}),
      );
    }

    showEditDialog({Todo? todo}) {
      showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              elevation: 5,
              builder: (_) => DialogEdit(context: context, todo: todo))
          .then((value) {
        if (value != null) {
          // nullではない場合は追加または更新する
          launchScreenNotifier.addOrUpdateTodo(value);
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
