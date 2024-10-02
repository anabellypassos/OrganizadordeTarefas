import 'package:sqflite/sqflite.dart';  //banco de dados SQLite no Flutter.
import 'package:path/path.dart'; //caminho do banco de dados.
import '../dados/event_model.dart'; //modelo de dados do evento é definido.

class DatabaseHelper {

  /*
  DatabaseHelper é uma singleton (padão), 
  o que significa que só haverá uma única 
  instância da classe durante todo o ciclo 
  de vida do aplicativo.
_instance é a instância única que será 
usada para acessar o banco de dados.
O método factory DatabaseHelper() sempre 
retorna essa instância única.
  */
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;



/*O construtor é privado para garantir que a classe só
 possa ser instanciada dentro dela mesma.
Isso faz parte do padrão singleton, garantindo que o 
aplicativo use apenas uma instância do DatabaseHelper.
*/

  DatabaseHelper._internal();


/*O atributo _database é a referência ao banco de dados.
Ele é inicializado como null e só será configurado quando o 
banco de dados for realmente acessado pela primeira vez.*/
  static Database? _database;



/*
Esse getter database verifica se a instância do banco de 
dados já foi criada.
Se _database já existe (não é null), ele retorna o banco.
Se _database for null, ele inicializa o banco de dados 
chamando o método _initDatabase(), e depois retorna a instância.
*/
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }


/*
O método _initDatabase() faz o seguinte:
Gera o caminho onde o banco de dados será armazenado usando
 getDatabasesPath() e join() (para criar um caminho adequado 
 ao sistema de arquivos).
Abre o banco de dados usando o openDatabase().
Se o banco ainda não existir, ele chama o método onCreate para
 criar uma tabela chamada events, com as colunas:
id: Chave primária (aumenta automaticamente).
name: Nome do evento.
date: Data do evento.*/ 

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'event_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE events(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, date TEXT)',
        );
      },
    );
  }



/*
Esse método insertEvent recebe um evento do tipo EventModel
e o insere no banco de dados.
Primeiro, ele acessa o banco de dados com database.
Depois, ele usa o método insert para inserir o evento na 
tabela events, convertendo o evento para um mapa usando event.toMap().
Ele retorna o id do evento inserido.
*/
  Future<int> insertEvent(EventModel event) async {
    Database db = await database;
    return await db.insert('events', event.toMap());
  }



/*
O método getEventsByDate busca eventos na tabela com base na data.
Usa o método query para selecionar os eventos onde a coluna date é 
igual à data passada como argumento.
Ele retorna uma lista de EventModel, convertendo cada item retornado
 do banco (um mapa) para um objeto EventModel com fromMap().
*/
  Future<List<EventModel>> getEventsByDate(String date) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      'events',
      where: 'date = ?',
      whereArgs: [date],
    );
    return result.map((e) => EventModel.fromMap(e)).toList();
  }



/*Esse método deleteEvent remove um evento da tabela com base no id.
Usa o método delete do banco de dados para remover o evento cujo id 
corresponde ao fornecido.
Retorna o número de linhas afetadas (número de eventos deletados). 
*/
  Future<int> deleteEvent(int id) async {
    Database db = await database;
    return await db.delete('events', where: 'id = ?', whereArgs: [id]);
  }
}
