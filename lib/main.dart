import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manager/blocs/counter/counter_bloc.dart';
import 'package:flutter_state_manager/screens/counter_screen.dart';
import 'package:flutter_state_manager/screens/home_screen.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final bloc = CounterBloc();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(value: bloc, child: HomeScreen()),
        '/counter': (context) => BlocProvider.value(value: bloc, child: CounterScreen()),
      },
      initialRoute: '/',
    );
  }
}
