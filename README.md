# Northstar

Northstar is a Flutter prototype for a personal workspace. It demonstrates a sign-in flow, a dashboard, profile management, and settings in a Material 3 interface.

## Features

- Sign-in form with validation and prefilled demo credentials.
- Dashboard with sample workspace metrics and recent activity.
- Bottom navigation between Dashboard, Profile, and Settings, preserving each tab in an `IndexedStack`.
- Profile screen with sample account details and a log-out action.
- Settings screen with interactive mock Dark Mode and Notifications switches.
- Widget tests for sign-in, validation, tab navigation, and log out.

> **Prototype only:** Sign-in credentials, profile details, dashboard data, and settings are hardcoded or kept in memory. There is no authentication service or backend; do not use this implementation to protect real accounts or data.

## Getting Started

Install the [Flutter SDK](https://docs.flutter.dev/get-started/install), then run these commands from the project root:

```sh
flutter pub get
flutter run
```

The sign-in form is prefilled with the demo account:

| Username | Password |
|---|---|
| `raiza123` | `admin123` |

Run the tests and static analysis with:

```sh
flutter test
flutter analyze
```

## Project Structure

```text
lib/
├── main.dart                  # App setup, theme, and named routes
├── models/
│   └── app_data.dart          # Sample profile and dashboard data
└── screens/
    ├── login_screen.dart
    ├── main_navigation_screen.dart
    ├── dashboard_screen.dart
    ├── profile_screen.dart
    └── settings_screen.dart
test/
├── navigation_test.dart       # Sign-in and navigation flows
└── widget_test.dart
```