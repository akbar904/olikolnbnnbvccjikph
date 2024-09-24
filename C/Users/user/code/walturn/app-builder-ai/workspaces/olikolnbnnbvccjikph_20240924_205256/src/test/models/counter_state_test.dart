
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/models/counter_state.dart';

void main() {
	group('CounterState Model Tests', () {
		test('CounterState should have correct initial value', () {
			final counterState = CounterState(value: 0);
			expect(counterState.value, 0);
		});

		test('CounterState should correctly serialize to JSON', () {
			final counterState = CounterState(value: 10);
			final json = counterState.toJson();
			expect(json, {'value': 10});
		});

		test('CounterState should correctly deserialize from JSON', () {
			final json = {'value': 20};
			final counterState = CounterState.fromJson(json);
			expect(counterState.value, 20);
		});
	});
}
