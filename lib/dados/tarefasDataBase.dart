import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'atrefasdatabase.dart';

class TarefaDatabase {
  static final TarefaDatabase instance = TarefaDatabase._init();
  static Database? _database;

  TarefaDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase('tarefas.db');
    return _database!;
  }

  Future<Database> _initDatabase(String filePath) async {
    return await openDatabase(
      join(await getDatabasesPath(), filePath),
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tarefas(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nametarefa TEXT NOT NULL,
        descricao TEXT NOT NULL,
        concluida INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  Future<void> inserirTarefa(Atrefasdatabase tarefa) async {
    final db = await instance.database;
    await db.insert(
      'tarefas',
      
      tarefa.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Atrefasdatabase>> buscarTarefas() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('tarefas');

    return List.generate(maps.length, (i) {
      return Atrefasdatabase.fromMap(maps[i]);
    });
  }
   // Método para atualizar o status de conclusão da tarefa
  Future<void> atualizarStatusTarefa(int id, bool concluida) async {
    final db = await instance.database;
    await db.update(
      'tarefas',
      {'concluida': concluida ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
   Future<void> excluirTarefa(int id) async {
    final db = await instance.database;
    await db.delete(
      'tarefas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

