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
    // テストのために固定でtodosを入れる
    state = state.copyWith(todos: [
      const Todo(title: 'test1', description: 'test1の説明'),
      const Todo(title: 'test2', description: 'test2の説明'),
      const Todo(title: 'test3', description: 'test3の説明'),
    ]);
  }

  // loadingを変更する
  changeLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}

final launchScreenProvider =
    StateNotifierProvider.autoDispose<LaunchScreenNotifier, LaunchScreenState>(
        (ref) => LaunchScreenNotifier());
