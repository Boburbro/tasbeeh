import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabaseService {
  static final LocalDatabaseService _instance =
      LocalDatabaseService._internal();
  factory LocalDatabaseService() => _instance;
  LocalDatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'base.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        plan_day INTEGER NOT NULL,
        count INTEGER DEFAULT 0,
        title TEXT NUT NULL,
        description TEXT DEFAULT NULL,
        start_time TIMESTAMP NOT NULL,
        end_time TIMESTAMP NOT NULL
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('tasks', row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    final db = await database;
    return await db.query('tasks');
  }

  Future<int> update(Map<String, dynamic> row) async {
    final db = await database;
    int id = row['id'];
    return await db.update('tasks', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
