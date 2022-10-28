/* 어떤 Event에 대해 어떤 State 변화가 발생하는지 정의 */

import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // CounterBloc() : super(const CounterState(0));

  /*@override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is CounterIncrement) {
      yield CounterState(state.count + 1);
    } else if (event is CounterDecrement) {
      yield CounterState(state.count - 1);
    }
  }*/

  CounterBloc() : super(const CounterState(0)) { // 초기화 리스트로 구현부 실행되기 전에 state 초기화
    /* register Events */
    on<CounterIncrement>((event, emit) => emit(CounterState(state.count + 1)));
    on<CounterDecrement>((event, emit) => emit(CounterState(state.count -1 )));
  }

  @override
  void onEvent(CounterEvent event) {
    // TODO: implement onEvent
    super.onEvent(event);
    print(event);
  }

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    super.onTransition(transition);
    print(transition);
    print('currentState: ${transition.currentState.count}');
    print('nextState: ${transition.nextState.count}');
  }

}
