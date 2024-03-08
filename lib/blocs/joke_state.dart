import 'package:test_assignment_zens/models/joke.dart';

abstract class JokeState {}

class JokeStateInitial extends JokeState {}

class JokeStateLoading extends JokeState {}

class JokeStateLoaded extends JokeState {
  final Joke joke;

  JokeStateLoaded(this.joke);
}

class JokeStateUpdated extends JokeState {}

class JokeStateError extends JokeState {
  final String error;

  JokeStateError(this.error);
}
