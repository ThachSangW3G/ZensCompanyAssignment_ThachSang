import 'package:test_assignment_zens/models/joke.dart';

abstract class JokeEvent {}

class JokeEventGetJoke extends JokeEvent {
  final int jokeId;
  JokeEventGetJoke(this.jokeId);
}

class JokeEventUpdate extends JokeEvent {
  final Joke joke;
  JokeEventUpdate(this.joke);
}

class JokeEventSave extends JokeEvent {
  final List<Joke> jokes;
  JokeEventSave(this.jokes);
}

class JokeEventDelete extends JokeEvent {
  JokeEventDelete();
}
