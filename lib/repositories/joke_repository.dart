import 'package:test_assignment_zens/databases/database.dart';
import 'package:test_assignment_zens/models/joke.dart';

class JokeRepository {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<List<Joke>> getJokes() async {
    try {
      final jokes = await dbHelper.getJokes();
      return jokes;
    } catch (e) {
      throw Exception('Lỗi: $e');
    }
  }

  Future<Joke> getJoke(int jokeId) async {
    try {
      final joke = await dbHelper.getJoke(jokeId);
      return joke;
    } catch (e) {
      throw Exception('Lỗi: $e');
    }
  }

  Future<void> updateJoke(Joke joke) async {
    try {
      await dbHelper.updateJoke(joke);
    } catch (e) {
      throw Exception('Lỗi: $e');
    }
  }

  Future<void> saveJoke(List<Joke> jokes) async {
    try {
      await dbHelper.saveJokes(jokes);
    } catch (e) {
      throw Exception('Lỗi: $e');
    }
  }

  Future<void> deleteJoke() async {
    try {
      await dbHelper.deleteAllJokes();
    } catch (e) {
      throw Exception('Lỗi: $e');
    }
  }
}
