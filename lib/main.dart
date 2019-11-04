import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiple_bloc/base_repository.dart';
import 'package:flutter_multiple_bloc/bloc/bloc.dart';

import 'package:flutter_multiple_bloc/pages/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FirstBlocBloc>(builder: (BuildContext context) => FirstBlocBloc(FakeRepository())),
          BlocProvider<SecondBlocBloc>(builder: (BuildContext context) => SecondBlocBloc(FakeRepository())),
        ],
        child: HomePage(title: 'Flutter Bloc Demo'),
      ),
    );
  }
}
