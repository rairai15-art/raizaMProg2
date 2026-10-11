import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navigations/main.dart';

void main() {
  group('Navigation Flow Tests', () {
    testWidgets(
      'Initial screen is LoginScreen with inputs and sign in button',
      (tester) async {
        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        expect(find.text('Welcome Back'), findsOneWidget);
        expect(find.byKey(const Key('email_field')), findsOneWidget);
        expect(find.byKey(const Key('password_field')), findsOneWidget);
        expect(find.byKey(const Key('login_button')), findsOneWidget);
      },
    );

    testWidgets(
      'Clicking Login button navigates to Dashboard with BottomNavigationBar',
      (tester) async {
        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        // Tap login
        final loginButton = find.byKey(const Key('login_button'));
        expect(loginButton, findsOneWidget);
        await tester.tap(loginButton);
        await tester.pumpAndSettle();

        // Check Dashboard is visible
        expect(find.text('Dashboard Overview'), findsOneWidget);
        expect(find.byKey(const Key('bottom_nav_bar')), findsOneWidget);

        // Verify bottom bar tabs exist
        expect(find.text('Dashboard'), findsOneWidget);
        expect(find.text('Profile'), findsOneWidget);
        expect(find.text('Setting'), findsOneWidget);
      },
    );

    testWidgets('Invalid credentials stay on login screen', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byKey(const Key('email_field')),
        'wrong-user',
      );
      await tester.enterText(
        find.byKey(const Key('password_field')),
        'wrong-pass',
      );
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pumpAndSettle();

      expect(find.byKey(const Key('login_error')), findsOneWidget);
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Dashboard Overview'), findsNothing);
    });

    testWidgets(
      'Tapping BottomNavigationBar items switches between Dashboard, Profile, and Setting',
      (tester) async {
        await tester.pumpWidget(const MyApp());
        await tester.pumpAndSettle();

        // Login first
        await tester.tap(find.byKey(const Key('login_button')));
        await tester.pumpAndSettle();

        // Verify on Dashboard
        expect(find.text('Dashboard Overview'), findsOneWidget);

        // Tap Profile tab
        await tester.tap(find.byKey(const Key('nav_profile')));
        await tester.pumpAndSettle();

        // Verify Profile screen content
        expect(find.text('Raiza'), findsOneWidget);
        expect(find.text('Workspace Administrator'), findsOneWidget);

        // Tap Setting tab
        await tester.tap(find.byKey(const Key('nav_setting')));
        await tester.pumpAndSettle();

        // Verify Setting screen content
        expect(find.text('App Settings'), findsOneWidget);
        expect(find.text('Dark Mode'), findsOneWidget);

        // Tap Dashboard tab again
        await tester.tap(find.byKey(const Key('nav_dashboard')));
        await tester.pumpAndSettle();

        // Verify Dashboard screen content again
        expect(find.text('Dashboard Overview'), findsOneWidget);
      },
    );

    testWidgets('Logging out from Profile returns to LoginScreen', (
      tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      // Login
      await tester.tap(find.byKey(const Key('login_button')));
      await tester.pumpAndSettle();

      // Switch to Profile
      await tester.tap(find.byKey(const Key('nav_profile')));
      await tester.pumpAndSettle();

      // Ensure visible and tap logout
      await tester.drag(find.byType(ListView), const Offset(0, -500));
      await tester.pumpAndSettle();
      final logoutButton = find.byKey(const Key('profile_logout_button'));
      expect(logoutButton, findsOneWidget);
      await tester.ensureVisible(logoutButton);
      await tester.pumpAndSettle();
      await tester.tap(logoutButton);
      await tester.pumpAndSettle();

      // Back on Login Screen
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.byKey(const Key('login_button')), findsOneWidget);
    });
  });
}
