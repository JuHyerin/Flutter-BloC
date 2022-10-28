import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manager/blocs/counter/counter_bloc.dart';
import 'package:flutter_state_manager/screens/bloc_practice_screen/counter_screen.dart';
import 'package:flutter_state_manager/screens/bloc_practice_screen/home_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider( // BloC 을 사용할 위젯을 감쌈
      create: (context) => CounterBloc(), // 전역 Bloc 생성
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => HomeScreen(),
          '/bloc/home': (context) => HomeScreen(),
          '/bloc/counter': (context) => CounterScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
