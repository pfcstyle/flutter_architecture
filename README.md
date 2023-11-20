# flutter_architecture

Thanks [flutter-clean-architecture-riverpod](https://github.com/Uuttssaavv/flutter-clean-architecture-riverpod)

A new Flutter project follow clean architecture with Riverpod.

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

### Project Description

#### Data

The data layer is the outermost layer of the application and is responsible for communicating with the server-side or a local database and data management logic. It also contains repository implementations.

##### a. Data Source

Describes the process of acquiring and updating the data.
Consist of remote and local Data Sources. Remote Data Source will perform HTTP requests on the API. At the same time, local Data sources will cache or persist data.

##### b. Repository

The bridge between the Data layer and the Domain layer.
Actual implementations of the repositories in the Domain layer. Repositories are responsible for coordinating data from the different Data Sources.

#### Domain

The domain layer is responsible for all the business logic. It is written purely in Dart without flutter elements because the domain should only be concerned with the business logic of the application, not with the implementation details.

##### a. Providers

Describes the logic processing required for the application.
Communicates directly with the repositories.

##### b. Repositories

Abstract classes that define the expected functionality of outer layers.

#### Presentation

The presentation layer is the most framework-dependent layer. It is responsible for all the UI and handling the events in the UI. It does not contain any business logic.

##### a. Widget (Screens/Views)

Widgets notify the events and listen to the states emitted from the `StateNotifierProvider`.

##### b. Providers

Describes the logic processing required for the presentation.
Communicates directly with the `Providers` from the domain layer.

### Project Description

- `main.dart` file has services initialization code and wraps the root `MyApp` with a `ProviderScope`
- `main/app.dart` has the root `MaterialApp` and initializes `AppRouter` to handle the route throughout the application.
- `services` abstract app-level services with their implementations.
- The `shared` folder contains code shared across features
  - `theme` contains general styles (colors, themes & text styles)
  - `model` contains all the Data models needed in the application.
  - `http` is implemented with Dio.
  - `storage` is implemented with SharedPreferences.
  - Service locator pattern and Riverpod are used to abstract services when used in other layers.

```
dart pub global activate flutter_gen
dart run build_runner watch -d
dart run build_runner build
flutter gen-l10n
bool isRtl = Directionality.of(context) == TextDirection.rtl;
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
