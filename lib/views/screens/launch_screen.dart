import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/util/common.dart';
import 'package:todo_app_flutter/view_models/launch_screen_notifier.dart';
import 'package:todo_app_flutter/views/widgets/dialogs/dialog_delete.dart';
import 'package:todo_app_flutter/views/widgets/dialogs/dialog_edit.dart';
import 'package:todo_app_flutter/views/widgets/todo_list.dart';

class LaunchScreen extends ConsumerWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    showDeleteDialog() {
      showDialog(
        context: context,
        builder: (_) => DialogDelete(context: context, onPressed: () {}),
      );
    }

    showEditDialog() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          elevation: 5,
          builder: (_) => DialogEdit(context: context, onPressed: () {}));
    }

    final launchScreenState = ref.watch(launchScreenProvider);

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
