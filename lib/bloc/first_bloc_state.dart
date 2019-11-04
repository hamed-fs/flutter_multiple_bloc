import 'package:equatable/equatable.dart';

abstract class FirstBlocState extends Equatable {
  const FirstBlocState();
}

class FirstBlocInitialState extends FirstBlocState {
  @override
  List<Object> get props => [];
}

class FirstBlocLoadingState extends FirstBlocState {
  @override
  List<Object> get props => [];
}

class FirstBlocLoadedState extends FirstBlocState {
  final String data;

  FirstBlocLoadedState(this.data);

  @override
  List<Object> get props => [data];
}
