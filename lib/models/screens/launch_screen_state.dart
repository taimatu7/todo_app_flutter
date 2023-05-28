import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app_flutter/models/todo.dart';

part 'launch_screen_state.freezed.dart';

@freezed
abstract class LaunchScreenState with _$LaunchScreenState {
  const factory LaunchScreenState({
    @Default(false) bool isLoading,
    @Default([]) List<Todo> todos,
  }) = _LaunchScreenState;
}
