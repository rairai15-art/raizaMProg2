import 'package:flutter_test/flutter_test.dart';
import 'package:navigations/main.dart';

void main() {
  testWidgets('App smoke test - starts on LoginScreen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back'), findsOneWidget);
  });
}
