import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  late Database _db;

  Future<Database> init() async {
    String path = join(await getDatabasesPath(), 'todo.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await createTables(db);
    });
  }

  Future<Database> get db async {
    _db = await init();
    return _db;
  }

  Future<void> createTables(Database db) async {
    await db.execute("""CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        content TEXT,
        isDone INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }
}
