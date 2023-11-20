# flutter_architecture

Thanks for https://github.com/Uuttssaavv/flutter-clean-architecture-riverpod

A new Flutter project template using clean architecture with Riverpod.

```
dart pub global activate flutter_gen
dart run build_runner watch -d
dart run build_runner build
flutter gen-l10n
bool isRtl = Directionality.of(context) == TextDirection.rtl;
```

### What is used in this project?

- **Riverpod**
  Used for state management
- **Freezed**
  Code generation
- **Dartz**
  Functional Programming `Either<Left,Right>`
- **Auto Route**
  Navigation package that uses code generation to simplify route setup
- **Dio**
  Http client for dart. Supports interceptors and global configurations
- **Shared Preferences**
  Persistent storage for simple data
- **logger**
  Small, easy to use and extensible logger which prints beautiful logs.
- **intl** and **flutter_localizations**
  l10n
- **Flutter and Dart**
  And obviously flutter and dart 😅


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
