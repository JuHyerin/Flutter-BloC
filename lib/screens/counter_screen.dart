import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manager/blocs/counter/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen'),),
      body: BlocConsumer<CounterBloc, CounterState>( // BloC 의 변화에 따라 위젯을 빌드
        listener: (context, state) {
          if(state.count < 0) {
            showDialog(
                context: context,
                builder: (context) {
                  return const SimpleDialog(
                    title: Center(child: Text('Bloc Listener Test'),),
                    children: [
                      Center(child: Text('count 마이너스!'),)
                    ],
                  );
                },
            );
          }
        },
        buildWhen: (previous, current) => previous.count != current.count, // default: 상태 변화
        builder: ((context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('count: ${state.count.toString()}'),
                TextButton(
                    onPressed: () {
                      // Event 를 BloC 추가하기 위해 BlocProvider 에 접근
                      BlocProvider.of<CounterBloc>(context).add(const CounterIncrement());
                    },
                    child: const Text('[+] Increment')
                ),
                TextButton(
                    onPressed: () {
                      // Event 를 BloC 추가하기 위해 BlocProvider 에 접근
                      BlocProvider.of<CounterBloc>(context).add(const CounterDecrement());
                    },
                    child: const Text('[-] Decrement')
                ),
                TextButton(
                    onPressed: () => Navigator.of(context).pushNamed('/'),
                    child: const Text('Go to HomeScreen')
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
