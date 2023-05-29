import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/data/repositories/todo_local_repository_impl.dart';
import 'package:todo_app_flutter/models/todo.dart';

final todoRepositoryProvider = Provider.autoDispose(
  (_) => TodoLocalRepositoryImpl(),
);

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
  Future<int> addOrUpdateTodo({
    required Todo todo,
  });
  Future<int> deleteTodoById({
    required int id,
  });
}
