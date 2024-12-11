
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/main.dart';

void main() {
	group('Main Entry Point', () {
		test('App initializes correctly', () {
			// Setup
			TestWidgetsFlutterBinding.ensureInitialized();

			// Test
			main();

			// Verify
			expect(find.byType(MyApp), findsOneWidget);
		});
	});

	group('MyApp Widget', () {
		testWidgets('MyApp loads CounterScreen', (WidgetTester tester) async {
			// Setup
			await tester.pumpWidget(MyApp());

			// Verify
			expect(find.byType(CounterScreen), findsOneWidget);
		});
	});
}
