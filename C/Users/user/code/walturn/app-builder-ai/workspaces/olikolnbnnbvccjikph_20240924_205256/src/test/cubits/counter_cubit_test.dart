
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/cubits/counter_cubit.dart';
import 'package:counter_app/models/counter_state.dart';

// Mock class for CounterCubit dependencies, if any
class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {}

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is CounterState(value: 0)', () {
			expect(counterCubit.state, CounterState(value: 0));
		});

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(value: 10)] when increment() is called once',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [CounterState(value: 10)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(value: 10), CounterState(value: 20)] when increment() is called twice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [CounterState(value: 10), CounterState(value: 20)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(value: 10), CounterState(value: 20), CounterState(value: 30)] when increment() is called thrice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
				cubit.increment();
			},
			expect: () => [CounterState(value: 10), CounterState(value: 20), CounterState(value: 30)],
		);
	});
}
