import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/data/repositories/todo_repository.dart';
import 'package:todo_app_flutter/models/screens/launch_screen_state.dart';
import 'package:todo_app_flutter/models/todo.dart';

final launchScreenProvider =
    StateNotifierProvider.autoDispose<LaunchScreenNotifier, LaunchScreenState>(
  (ref) => LaunchScreenNotifier(
    ref.read(todoRepositoryProvider),
  ),
);

class LaunchScreenNotifier extends StateNotifier<LaunchScreenState> {
  final TodoRepository todoRepository;

  LaunchScreenNotifier(this.todoRepository) : super(const LaunchScreenState()) {
    // 初期化時にデータを取得する
    fetchTodos();
  }

  // DBからtodoリストを取得する
  fetchTodos() async {
    state = state.copyWith(isLoading: true);
    final todos = await todoRepository.fetchTodos();
    state = state.copyWith(todos: todos, isLoading: false);
  }

  // todoを追加する
  addOrUpdateTodo(Todo todo) async {
    // DBに保存する
    await todoRepository.addOrUpdateTodo(todo: todo);
    final index = state.todos.indexWhere((element) => element.id == todo.id);

    // すでに存在する場合は更新、存在しない場合は追加する
    if (index == -1) {
      state = state.copyWith(todos: [...state.todos, todo]);
    } else {
      final todos = [...state.todos];
      todos[index] = todo;
      state = state.copyWith(todos: todos);
    }
  }

  // todoを削除する
  deleteTodoById(id) async {
    await todoRepository.deleteTodoById(id: id);
    final todos = [...state.todos];
    todos.removeWhere((element) => element.id == id);
    state = state.copyWith(todos: todos);
  }

  // loadingを変更する
  changeLoadingState(bool isLoading) async {
    state = state.copyWith(isLoading: isLoading);
  }
}
