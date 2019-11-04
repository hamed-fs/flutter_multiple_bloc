import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multiple_bloc/bloc/bloc.dart';
import 'package:flutter_multiple_bloc/bloc/first_bloc_bloc.dart';
import 'package:flutter_multiple_bloc/bloc/first_bloc_event.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(32.0),
              padding: EdgeInsets.all(32.0),
              child: BlocListener<FirstBlocBloc, FirstBlocState>(
                child: BlocBuilder<FirstBlocBloc, FirstBlocState>(
                  builder: (context, state) {
                    if (state is FirstBlocInitialState) {
                      return _buildInitialWidget();
                    } else if (state is FirstBlocLoadingState) {
                      return _buildLoadingWidget();
                    } else if (state is FirstBlocLoadedState) {
                      _getSecondData(context, 'SECOND BLOC');

                      return _buildLoadedWidget(state.data);
                    }

                    return Text("ERROR!");
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(32.0),
              padding: EdgeInsets.all(32.0),
              child: BlocBuilder<SecondBlocBloc, SecondBlocState>(
                builder: (context, state) {
                  if (state is SecondBlocInitialState) {
                    return _buildInitialWidget();
                  } else if (state is SecondBlocLoadingState) {
                    return _buildLoadingWidget();
                  } else if (state is SecondBlocLoadedState) {
                    return _buildLoadedWidget(state.data);
                  }

                  return Text("ERROR!");
                },
              ),
            ),
            RaisedButton(
              child: Text('GET DATA'),
              onPressed: () => _getFirstData(context, 'FIRST BLOC'),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInitialWidget() {
    return Text('INITIAL DATA');
  }

  Widget _buildLoadingWidget() {
    return CircularProgressIndicator();
  }

  Widget _buildLoadedWidget(String data) {
    return Text(data);
  }

  void _getFirstData(BuildContext context, String data) {
    BlocProvider.of<FirstBlocBloc>(context).add(GetFirst(data));
  }

  void _getSecondData(BuildContext context, String data) {
    final SecondBlocBloc bloc = BlocProvider.of<SecondBlocBloc>(context);

    bloc.add(GetSecond(data));
  }
}
