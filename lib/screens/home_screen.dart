import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manager/blocs/counter/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),),
      body: BlocBuilder<CounterBloc, CounterState>( // BloC 의 변화에 따라 위젯을 빌드
        bloc: CounterBloc(), // BloC for single widget -> 전역상태에 이벤트 발생시켜도 현재 페이지의 state 영향x
        buildWhen: (previous, current) => previous.count != current.count, // default: 상태 변화
        builder: ((context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('count: ${state.count.toString()}'),
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
