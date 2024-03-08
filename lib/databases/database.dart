import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_assignment_zens/models/joke.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'JokeDatabase.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS Jokes (
          jokeId INTEGER,
          title TEXT,
          describe TEXT,
          content TEXT, 
          isFunny BOOL
        )
        ''');
    });
  }

  Future<void> saveJokes(List<Joke> jokes) async {
    Database db = await database;
    Batch batch = db.batch();
    jokes.forEach((joke) {
      batch.insert('Jokes', joke.toJson());
    });
    print('save jokes success');
    await batch.commit();
  }

  Future<List<Joke>> getJokes() async {
    Database db = await database;
    List<Map<String, dynamic>> results = await db.query('Jokes');
    return results.map((map) => Joke.fromJson(map)).toList();
  }

  Future<Joke> getJoke(int jokeId) async {
    Database db = await database;
    var res = await db.query("Jokes", where: "jokeId = ?", whereArgs: [jokeId]);
    return Joke.fromJson(res.first);
  }

  Future<void> updateJoke(Joke joke) async {
    final db = await database;
    await db.update("Jokes", joke.toJson(),
        where: "jokeId = ?", whereArgs: [joke.jokeId]);
  }

  Future<void> deleteAllJokes() async {
    Database db = await database;
    await db.delete('Jokes');
  }
}
