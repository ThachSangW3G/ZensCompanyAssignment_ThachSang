import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_assignment_zens/blocs/joke_event.dart';
import 'package:test_assignment_zens/blocs/joke_state.dart';
import 'package:test_assignment_zens/repositories/joke_repository.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository _repository;

  JokeBloc(this._repository) : super(JokeStateInitial()) {
    on<JokeEventSave>(_mapSaveJokeToState);
    on<JokeEventGetJoke>(_mapGetJokeToState);
    on<JokeEventUpdate>(_mapUpdateJokeToState);
    on<JokeEventDelete>(_mapDeleteJokeToState);
  }

  Future<void> _mapGetJokeToState(
      JokeEventGetJoke event, Emitter<JokeState> emit) async {
    emit(JokeStateLoading());
    try {
      final joke = await _repository.getJoke(event.jokeId);
      emit(JokeStateLoaded(joke));
    } catch (error) {
      emit(JokeStateError(error.toString()));
    }
  }

  Stream<JokeState> _mapUpdateJokeToState(
      JokeEventUpdate event, Emitter<JokeState> emit) async* {
    emit(JokeStateLoading());
    try {
      await _repository.updateJoke(event.joke);
      emit(JokeStateUpdated());
    } catch (error) {
      emit(JokeStateError(error.toString()));
    }
  }

  Future<void> _mapSaveJokeToState(
      JokeEventSave event, Emitter<JokeState> emit) async {
    emit(JokeStateLoading());
    try {
      await _repository.saveJoke(event.jokes);
      emit(JokeStateUpdated());
    } catch (error) {
      emit(JokeStateError(error.toString()));
    }
  }

  Future<void> _mapDeleteJokeToState(
      JokeEventDelete event, Emitter<JokeState> emit) async {
    emit(JokeStateLoading());
    try {
      await _repository.deleteJoke();
      emit(JokeStateUpdated());
    } catch (error) {
      emit(JokeStateError(error.toString()));
    }
  }
}
