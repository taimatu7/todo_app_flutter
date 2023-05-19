import 'package:flutter/material.dart';
import 'package:todo_app_flutter/database/todo_dao.dart';
import 'package:todo_app_flutter/models/todo.dart';
import 'package:todo_app_flutter/util/common.dart';
import 'package:todo_app_flutter/widgets/dialogs/dialog_delete.dart';
import 'package:todo_app_flutter/widgets/dialogs/dialog_edit.dart';
import 'package:todo_app_flutter/widgets/todo_list.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool _isLoading = false;
  late TodoDao todoDao;
  late TodoList todoList;

  @override
  initState() {
    super.initState();
    todoDao = TodoDao();
    todoList = TodoList(
        showDeleteDialog: showDeleteDialog, showEditDialog: showEditDialog);
  }

  showDeleteDialog(int id) {
    showDialog(
      context: context,
      builder: (_) =>
          DialogDelete(context: context, onPressed: deleteTodoById, id: id),
    );
  }

  showEditDialog(Todo? todo) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      elevation: 5,
      builder: (_) =>
          DialogEdit(context: context, onPressed: addOrUpdateTodo, todo: todo),
    );
  }

  void addOrUpdateTodo(Todo todo) async {
    setState(() {
      _isLoading = true;
    });
    await todoDao.addOrUpdateTodo(todo).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void deleteTodoById(int id) async {
    setState(() {
      _isLoading = true;
    });
    await todoDao.deleteTodoById(id).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOリスト'),
        backgroundColor: Common.themeColor,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : todoList,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showEditDialog(const Todo(title: '', content: '', isDone: 0));
          }),
    );
  }
}
