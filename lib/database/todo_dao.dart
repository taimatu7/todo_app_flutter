import 'package:sqflite/sqflite.dart';
import 'package:todo_app_flutter/database/app_database.dart';
import 'package:todo_app_flutter/models/todo.dart';

class TodoDao {
  final String _tableName = 'todos';
  final AppDatabase _appDatabase = AppDatabase();

  /// DB取得
  Future<Database> get db async {
    return await _appDatabase.db;
  }

  /// todoリスト取得
  Future<List<Todo>> getTodos() async {
    final db = await this.db;
    return db.query(_tableName, orderBy: "id").then((value) {
      return value.map((e) => Todo.fromJson(e)).toList();
    });
  }

  /// todoリスト追加または更新
  Future<int> addOrUpdateTodo(Todo todo) async {
    final db = await this.db;
    final id = await db.insert(
      _tableName,
      todo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  /// todoリスト削除
  Future<void> deleteTodoById(int id) async {
    final db = await this.db;
    try {
      await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }
}
