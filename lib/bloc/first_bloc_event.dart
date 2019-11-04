import 'package:equatable/equatable.dart';

abstract class FirstBlocEvent extends Equatable {
  const FirstBlocEvent();
}

class GetFirst implements FirstBlocEvent {
  final String data;

  GetFirst(this.data);

  @override
  List<Object> get props => [data];
}
