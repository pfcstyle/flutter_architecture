import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/main/app.dart';
import 'package:flutter_architecture/main/app_env.dart';
import 'package:flutter_architecture/main/log.dart';
import 'package:flutter_architecture/main/observers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  FlutterError.onError = (FlutterErrorDetails details) {
    // Process flutter framework's exception
    Log.f("Flutter framework's exception occured: ${details.informationCollector}", error: details.exception, stackTrace: details.stack);
  };
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  runZonedGuarded(() => {
    runApp(ProviderScope(
      observers: [
        Observers(),
      ],
      child: MyApp(),
    ))
  }, (error, stack) { 
    // Process other uncaught exceptions
    Log.f("Some uncaught exception occured.", error: error, stackTrace: stack);
  });
  
}
