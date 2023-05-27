import 'package:flutter/material.dart';
import 'package:todo_app_flutter/util/common.dart';
import 'package:todo_app_flutter/views/widgets/dialogs/dialog_delete.dart';
import 'package:todo_app_flutter/views/widgets/dialogs/dialog_edit.dart';
import 'package:todo_app_flutter/views/widgets/todo_list.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool _isLoading = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOリスト'),
        backgroundColor: Common.themeColor,
      ),
      body: !_isLoading
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
