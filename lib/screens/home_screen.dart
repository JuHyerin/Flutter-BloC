import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manager/blocs/counter/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),),
      body: BlocSelector<CounterBloc, CounterState, int>( // BloC 의 변화에 따라 위젯을 빌드
        selector: (state) => state.count, // state 의 형태를 조작하여 builder 에 전달
        builder: ((context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('count: ${state.toString()}'),
                TextButton(
                    onPressed: () => Navigator.of(context).pushNamed('/counter'),
                    child: const Text('Go to CounterScreen')
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
