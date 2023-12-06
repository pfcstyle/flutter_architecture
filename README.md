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
- **flutter_screenutil**
  Responsive & adaptive
- **flutter_svg**
  Support svg render
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
- The `router` folder contains router configurations and handlers by auto_route.
- The `l10n` folder contains all language arbs.
- The `shared` folder contains code shared across features
  - `services` abstract app-level services with their implementations.
  - `theme` contains general styles (colors, themes & text styles)
  - `model` contains all the Data models needed in the application.
  - `http` is implemented with Dio.
  - `utils` contains all static util classes.
  - `widges` contains all widgets shared across features.
  - Service locator pattern and Riverpod are used to abstract services when used in other layers.

## Getting Started

##### Clone this repository

` git clone https://github.com/Uuttssaavv/flutter-clean-architecture-riverpod`

##### Go to the project directory

` cd flutter-clean-architecture-riverpod`

##### Get all the packages

`flutter pub get`

#### Get flutter_gen for l10n

`dart pub global activate flutter_gen`

##### Run the build runner command to generate code like router, freeze model and so on

`dart run build_runner build` or `dart run build_runner watch -d`

##### Run gen-l10n to generate l10n code
`flutter gen-l10n`

##### Run the project

`flutter run` or simply press ` F5 key` if you are using VSCode


## How to use l10n
1. Add new texts in app_en.arb only;
2. Generate l10n code by `flutter gen-l10n`;
3. Call L.of(context).{key} in code;

## How to use Log

Call by `Log.d`, `Log.v` ...

Log has verbose(trace, v), debug(d), information(i), warn(w), error(e), fatal(f) 6 modes

* verbose is the level for tracing some key and continual data flow in order to debug some problems
* debug is the level for printing some temp messages
* information is the level for recording some information when app is working normal
* The warning level is used for unexpected situations that may cause problems but do not necessarily indicate a system error
* The error level is used for outputting serious issues, such as runtime exceptions or operations that cannot be executed
* The fatal level is used when an assertion fails, typically to check for situations that should not occur

1. There are debug, dev, staging, prod envrionments, change env in main.dart;
2. For debug env, all logs will be printed;
3. For dev env, logs higher than debug(include) will be printed;
4. For staging and prod env, logs higher than warn(include) will be printed;

## How to manage Exception

Define all exceptions in `shared/exceptions/app_exception.dart > GlobalExceptions`

## How to manage assets

1. Image
   * Use .svg format
   * Put image into assets/images/**/* directory
   * Add new directories in flutter:assets in pubspec.yaml
   * Run `dart run build_runner build` to generate assets' code
   * For png, Call `Assets.images.[subDir].[imageName].image(...)`, ex. `Assets.images.index.activityIcon.image(width: 20, height: 20)`
   * For svg, Call `Assets.images.[subDir].[imageName].svg(...)`
   * In addition, Call `Assets.images.[subDir].[imageName].path` to get asset's load path
2. Color
   * In `shared/theme/extend_color_scheme.dart`, add light and dark color in AppColors class, add a universe color in ExtendColorScheme to merge light and dark
   * Universe color's name should be same to light color
   * Dark color name should be [lightName]Dark
   * Call `Theme.of(context).colorScheme.[universeColorName]`

## How to use text style

`AppTextStyles.get(color, size, weight, style, autoScale)`


## How to use responsive and adaptive

1. UI elements' size, padding, position... should be scaled with `number.w` or `number.h`
2. In most cases, scaling should be based on width with `.w`
3. If the layout is cramped in vertical space, consider scaling based on height with `.h`
4. Use responsive layout components as much as possible. https://docs.flutter.dev/ui/layout/responsive/adaptive-responsive

## How to add a new router

1. Add `@RoutePage()` on a page level widget
2. Config the new page in routes/app_route.dart
3. Run `dart run build_runner build` to generate route code
4. Call `AutoRouter.of(context).push()`, `.pop()`, `.replace()`, `.replaceAll()`, `.pushAndRemoveUntil()`, `.pushAndPopUntil()`, `.popUntil()` to control router navigation