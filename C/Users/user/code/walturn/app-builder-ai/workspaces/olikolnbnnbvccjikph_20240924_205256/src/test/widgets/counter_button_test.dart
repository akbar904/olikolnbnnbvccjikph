
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app/widgets/counter_button.dart';
import 'package:counter_app/cubits/counter_cubit.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterButton Widget Tests', () {
		testWidgets('should display the increment button', (WidgetTester tester) async {
			// Arrange
			final mockCounterCubit = MockCounterCubit();
			when(() => mockCounterCubit.state).thenReturn(0);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>.value(
						value: mockCounterCubit,
						child: Scaffold(
							body: CounterButton(),
						),
					),
				),
			);

			// Assert
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Increment'), findsOneWidget);
		});

		testWidgets('should call increment method when button is pressed', (WidgetTester tester) async {
			// Arrange
			final mockCounterCubit = MockCounterCubit();
			when(() => mockCounterCubit.state).thenReturn(0);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>.value(
						value: mockCounterCubit,
						child: Scaffold(
							body: CounterButton(),
						),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			// Assert
			verify(() => mockCounterCubit.increment()).called(1);
		});
	});
}
