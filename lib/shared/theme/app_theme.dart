import 'package:flutter_architecture/shared/services/common_service/domain/providers/sharedpreferences_storage_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/shared/services/common_service/domain/repositories/storage_repository.dart';
import 'package:flutter_architecture/shared/globals.dart';
import 'package:flutter_architecture/shared/theme/extend_color_scheme.dart';
import 'package:flutter_architecture/shared/theme/text_styles.dart';
import 'package:flutter_architecture/shared/theme/text_theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme.g.dart';

@riverpod
class AppThemeModeNotifier extends _$AppThemeModeNotifier {
  late final StorageRepository _stroageService;

  @override
  ThemeMode build() {
    // ref.onDispose(() { })
    // state = const AsyncValue.data(AuthState.initial());
    _stroageService = ref.watch(storageServiceProvider);
    getCurrentTheme();
    return ThemeMode.light;
  }

  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _stroageService.set(APP_THEME_STORAGE_KEY, state.name);
  }

  void getCurrentTheme() async {
    final theme = await _stroageService.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${theme ?? 'light'}');
    state = value;
  }
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.fontFamily,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(),
      // backgroundColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: TextThemes.darkTextTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primaryDrak,
        titleTextStyle: AppTextStyles.h2,
      ),
    );
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      textTheme: TextThemes.textTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      colorScheme: const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
