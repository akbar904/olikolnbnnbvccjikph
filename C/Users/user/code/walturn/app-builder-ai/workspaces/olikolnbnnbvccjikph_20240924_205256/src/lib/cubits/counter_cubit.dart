
import 'package:bloc/bloc.dart';
import 'package:counter_app/models/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
	CounterCubit() : super(CounterState(value: 0));

	void increment() {
		emit(CounterState(value: state.value + 10));
	}
}
