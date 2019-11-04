import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter_multiple_bloc/bloc/bloc.dart';
import 'package:flutter_multiple_bloc/base_repository.dart';

class FirstBlocBloc extends Bloc<FirstBlocEvent, FirstBlocState> {
  final BaseRepository repository;

  FirstBlocBloc(this.repository);

  @override
  FirstBlocState get initialState => FirstBlocInitialState();

  @override
  Stream<FirstBlocState> mapEventToState(FirstBlocEvent event) async* {
    yield FirstBlocLoadingState();

    if (event is GetFirst) {
      final data = await repository.getData(event.data);

      yield FirstBlocLoadedState(data);
    }
  }
}
