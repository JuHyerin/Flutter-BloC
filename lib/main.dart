import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manager/blocs/counter/counter_bloc.dart';
import 'package:flutter_state_manager/models/cart.dart';
import 'package:flutter_state_manager/repositories/item_list.dart';
import 'package:flutter_state_manager/screens/bloc_practice_screen/counter_screen.dart';
import 'package:flutter_state_manager/screens/bloc_practice_screen/home_screen.dart';
import 'package:flutter_state_manager/screens/provider_practice_screen/cart_screen.dart';
import 'package:flutter_state_manager/screens/provider_practice_screen/item_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const ProviderApp());
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
        Provider(create: (_) => ItemList()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (context) => ItemScreen(),
            '/provider/item': (context) => ItemScreen(),
            '/provider/cart': (context) => CartScreen(),
          },
          initialRoute: '/',
        );
      },
    );

  }
}

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

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
