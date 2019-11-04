import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_multiple_bloc/base_repository.dart';
import './bloc.dart';

class SecondBlocBloc extends Bloc<SecondBlocEvent, SecondBlocState> {
  final FakeRepository repository;

  SecondBlocBloc(this.repository);

  @override
  SecondBlocState get initialState => SecondBlocInitialState();

  @override
  Stream<SecondBlocState> mapEventToState(SecondBlocEvent event) async* {
    yield SecondBlocLoadingState();

    if (event is GetSecond) {
      final data = await repository.getData(event.data);

      yield SecondBlocLoadedState(data);
    }
  }
}
