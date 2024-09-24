
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/screens/counter_screen.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterScreen', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('renders CounterScreen', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: counterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.byType(CounterScreen), findsOneWidget);
		});

		testWidgets('displays initial counter value', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: counterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('displays incremented counter value', (WidgetTester tester) async {
			whenListen(counterCubit, Stream.fromIterable([0, 10]), initialState: 0);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: counterCubit,
						child: CounterScreen(),
					),
				),
			);

			expect(find.text('0'), findsOneWidget);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pumpAndSettle();

			expect(find.text('10'), findsOneWidget);
		});

		testWidgets('increments counter value when button is pressed', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);
			when(() => counterCubit.increment()).thenAnswer((_) async {});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: counterCubit,
						child: CounterScreen(),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			verify(() => counterCubit.increment()).called(1);
		});
	});
}
