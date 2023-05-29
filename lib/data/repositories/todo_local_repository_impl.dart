import 'package:todo_app_flutter/data/database/todo_dao.dart';
import 'package:todo_app_flutter/data/repositories/todo_repository.dart';
import 'package:todo_app_flutter/models/todo.dart';

class TodoLocalRepositoryImpl implements TodoRepository {
  final _dao = TodoDao();

  @override
  Future<int> addOrUpdateTodo({required Todo todo}) {
    return _dao.addOrUpdateTodo(todo);
  }

  @override
  Future<int> deleteTodoById({required int id}) {
    return _dao.deleteTodoById(id);
  }

  @override
  Future<List<Todo>> fetchTodos() {
    return _dao.fetchTodos();
  }
}
