import 'package:equatable/equatable.dart';

abstract class SecondBlocState extends Equatable {
  const SecondBlocState();
}

class SecondBlocInitialState extends SecondBlocState {
  @override
  List<Object> get props => [];
}

class SecondBlocLoadingState extends SecondBlocState {
  @override
  List<Object> get props => [];
}

class SecondBlocLoadedState extends SecondBlocState {
  final String data;

  SecondBlocLoadedState(this.data);

  @override
  List<Object> get props => [data];
}
