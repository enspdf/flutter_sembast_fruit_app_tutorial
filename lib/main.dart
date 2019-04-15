import 'package:flutter/material.dart';
import 'package:flutter_sembast_db_tutorial/fruit_bloc/fruit_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sembast_db_tutorial/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: FruitBloc(),
      child: MaterialApp(
        title: 'Seambast DB Tutorial',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
          accentColor: Colors.redAccent,
        ),
        home: HomePage(),
      ),
    );
  }
}
