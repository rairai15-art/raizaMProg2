# Directive: 4-Page Navigation System with BottomNavigationBar

## Objective
Implement a polished 4-page Flutter application with hardcoded details and responsive navigation:
1. **Login Page**: Authentication entry point.
2. **Dashboard Page**: Metrics overview, recent activity, quick actions.
3. **Profile Page**: User identity, statistics, profile details, action tiles.
4. **Setting Page**: App configurations, toggles, account management.

Navigation Rules:
- Tapping "Sign In" / "Login" transitions from Login Page to the Main Shell containing the `BottomNavigationBar` on the Dashboard tab.
- Tapping items on `BottomNavigationBar` toggles between Dashboard (index 0), Profile (index 1), and Setting (index 2).
- Tapping "Logout" resets back to Login Page.

## Inputs
- Hardcoded mock data for user profile, dashboard analytics, and settings items.
- Modern Material 3 styling theme (color seed, typography, elevated cards).

## Outputs
- `lib/models/app_data.dart`: Hardcoded mock models and static data.
- `lib/screens/login_screen.dart`: Login UI with validation and navigation to main shell.
- `lib/screens/main_navigation_screen.dart`: Shell containing the `BottomNavigationBar` and page switcher.
- `lib/screens/dashboard_screen.dart`: Overview metrics and activity UI.
- `lib/screens/profile_screen.dart`: Profile overview and user details UI.
- `lib/screens/settings_screen.dart`: Settings options and toggle controls UI.
- `lib/main.dart`: App bootstrap and route configurations.
- `test/navigation_test.dart`: Widget test suite confirming all navigation and page rendering flows.

## Dependencies
- Flutter SDK (>=3.13.3)
- `flutter/material.dart`
- `cupertino_icons`

## Execution Flow
1. **Red Phase**: Write unit/widget tests in `test/navigation_test.dart` for initial route, login navigation, and bottom navigation switches. Verify test failure.
2. **Green Phase**: Implement models, screens, and main entrypoint.
3. **Verification**: Execute test runner via `flutter test` to achieve 100% test pass. Run `flutter analyze` for clean code standards.
4. **Refactor Phase**: Format code, optimize UI layout, confirm no layer mixing.

## Failure Handling
- If route transition fails in tests, verify Key identifiers on buttons and bottom navigation destinations.
- If flutter analyzer reports warnings, resolve immediately.
