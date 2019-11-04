import 'package:equatable/equatable.dart';

abstract class SecondBlocEvent extends Equatable {
  const SecondBlocEvent();
}

class GetSecond implements SecondBlocEvent {
  final String data;

  GetSecond(this.data);

  @override
  List<Object> get props => [data];
}
