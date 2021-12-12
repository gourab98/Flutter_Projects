import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/model/note.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;
  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCRIMENT';
    final boolType = 'BOOLEAN NOT NULL';
    await db.execute('''
    CREATE TABLE $tableNotes(
      ${NoteFields.id} $idType,
      ${NoteFields.isImportant} $boolType,
      
    )
    ''');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
