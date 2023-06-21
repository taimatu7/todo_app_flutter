// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LaunchScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Todo> get todos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LaunchScreenStateCopyWith<LaunchScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchScreenStateCopyWith<$Res> {
  factory $LaunchScreenStateCopyWith(
          LaunchScreenState value, $Res Function(LaunchScreenState) then) =
      _$LaunchScreenStateCopyWithImpl<$Res, LaunchScreenState>;
  @useResult
  $Res call({bool isLoading, List<Todo> todos});
}

/// @nodoc
class _$LaunchScreenStateCopyWithImpl<$Res, $Val extends LaunchScreenState>
    implements $LaunchScreenStateCopyWith<$Res> {
  _$LaunchScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? todos = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todos: null == todos
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LaunchScreenStateCopyWith<$Res>
    implements $LaunchScreenStateCopyWith<$Res> {
  factory _$$_LaunchScreenStateCopyWith(_$_LaunchScreenState value,
          $Res Function(_$_LaunchScreenState) then) =
      __$$_LaunchScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Todo> todos});
}

/// @nodoc
class __$$_LaunchScreenStateCopyWithImpl<$Res>
    extends _$LaunchScreenStateCopyWithImpl<$Res, _$_LaunchScreenState>
    implements _$$_LaunchScreenStateCopyWith<$Res> {
  __$$_LaunchScreenStateCopyWithImpl(
      _$_LaunchScreenState _value, $Res Function(_$_LaunchScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? todos = null,
  }) {
    return _then(_$_LaunchScreenState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      todos: null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$_LaunchScreenState implements _LaunchScreenState {
  const _$_LaunchScreenState(
      {this.isLoading = false, final List<Todo> todos = const []})
      : _todos = todos;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Todo> _todos;
  @override
  @JsonKey()
  List<Todo> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  String toString() {
    return 'LaunchScreenState(isLoading: $isLoading, todos: $todos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LaunchScreenState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_todos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LaunchScreenStateCopyWith<_$_LaunchScreenState> get copyWith =>
      __$$_LaunchScreenStateCopyWithImpl<_$_LaunchScreenState>(
          this, _$identity);
}

abstract class _LaunchScreenState implements LaunchScreenState {
  const factory _LaunchScreenState(
      {final bool isLoading, final List<Todo> todos}) = _$_LaunchScreenState;

  @override
  bool get isLoading;
  @override
  List<Todo> get todos;
  @override
  @JsonKey(ignore: true)
  _$$_LaunchScreenStateCopyWith<_$_LaunchScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
