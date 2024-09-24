
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/widgets/counter_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/cubits/counter_cubit.dart';
import 'package:counter_app/models/counter_state.dart';

void main() {
	group('CounterDisplay Widget', () {
		testWidgets('displays the initial counter value', (WidgetTester tester) async {
			// Arrange
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => CounterCubit(),
						child: Scaffold(
							body: CounterDisplay(),
						),
					),
				),
			);

			// Assert
			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('updates the counter value when state changes', (WidgetTester tester) async {
			// Arrange
			final counterCubit = CounterCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider(
						create: (_) => counterCubit,
						child: Scaffold(
							body: CounterDisplay(),
						),
					),
				),
			);

			// Act
			counterCubit.increment();
			await tester.pumpAndSettle();

			// Assert
			expect(find.text('10'), findsOneWidget);
		});
	});
}
