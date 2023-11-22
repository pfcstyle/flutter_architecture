import 'package:flutter/material.dart';
import 'package:flutter_architecture/shared/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../routes/app_route.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeNotifierProvider).requireValue;
    return MaterialApp.router(
      onGenerateTitle: (context) => L.of(context).title,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: L.localizationsDelegates,
      supportedLocales: L.supportedLocales,
    );
  }
}
