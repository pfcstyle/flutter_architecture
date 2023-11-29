import 'package:flutter/material.dart';
import 'package:flutter_architecture/shared/theme/app_theme.dart';
import 'package:flutter_architecture/shared/responsive_adaptive/screen_size_type.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../routes/app_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeNotifierProvider);
    return ScreenUtilInit(
        designSize: getScreenSizeTypeByContext(context) == ScreenSizeType.medium
            ? const Size(375, 667)
            : const Size(1024, 1366),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MediaQuery(

            ///Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: MaterialApp.router(
              onGenerateTitle: (context) => L.of(context).title,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              routeInformationParser: appRouter.defaultRouteParser(),
              routerDelegate: appRouter.delegate(),
              debugShowCheckedModeBanner: false,
              localizationsDelegates: L.localizationsDelegates,
              supportedLocales: L.supportedLocales,
            )));
  }
}
