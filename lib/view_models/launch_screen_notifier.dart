import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/models/screens/launch_screen_state.dart';
import 'package:todo_app_flutter/models/todo.dart';

class LaunchScreenNotifier extends StateNotifier<LaunchScreenState> {
  LaunchScreenNotifier() : super(const LaunchScreenState()) {
    // 初期化時にデータを取得する
    fetchTodos();
  }

  // DBからtodoリストを取得する
  fetchTodos() async {
    state = state.copyWith();
  }

  // todoを追加する
  addOrUpdateTodo(Todo todo) async {
    // TODO DBを追加した後、idで比較するようにする
    final index =
        state.todos.indexWhere((element) => element.title == todo.title);

    // すでに存在する場合は更新、存在しない場合は追加する
    if (index == -1) {
      state = state.copyWith(todos: [...state.todos, todo]);
    } else {
      final todos = [...state.todos];
      todos[index] = todo;
      state = state.copyWith(todos: todos);
    }
  }

  // loadingを変更する
  changeLoadingState(bool isLoading) async {
    state = state.copyWith(isLoading: isLoading);
  }
}

final launchScreenProvider =
    StateNotifierProvider.autoDispose<LaunchScreenNotifier, LaunchScreenState>(
        (ref) => LaunchScreenNotifier());
