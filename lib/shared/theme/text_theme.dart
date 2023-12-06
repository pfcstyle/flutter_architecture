import 'package:flutter/material.dart';
import 'package:flutter_architecture/shared/theme/extend_color_scheme.dart';
import 'package:flutter_architecture/shared/theme/text_styles.dart';

class TextThemes {
  /// Main text theme

  static TextTheme get textTheme {
    final textStyle = AppTextStyles();
    return TextTheme(
      bodyLarge: textStyle.bodyLg,
      bodyMedium: textStyle.body,
      titleMedium: textStyle.bodySm,
      titleSmall: textStyle.bodyXs,
      displayLarge: textStyle.h1,
      displayMedium: textStyle.h2,
      displaySmall: textStyle.h3,
      headlineMedium: textStyle.h4,
    );
  }

  /// Dark text theme

  static TextTheme get darkTextTheme {
    final textStyle = AppTextStyles();
    return TextTheme(
      bodyLarge: textStyle.bodyLg.copyWith(color: AppColors.white),
      bodyMedium: textStyle.body.copyWith(color: AppColors.white),
      titleMedium: textStyle.bodySm.copyWith(color: AppColors.white),
      titleSmall: textStyle.bodyXs.copyWith(color: AppColors.white),
      displayLarge: textStyle.h1.copyWith(color: AppColors.white),
      displayMedium: textStyle.h2.copyWith(color: AppColors.white),
      displaySmall: textStyle.h3.copyWith(color: AppColors.white),
      headlineMedium: textStyle.h4.copyWith(color: AppColors.white),
    );
  }

  /// Primary text theme

  static TextTheme get primaryTextTheme {
    final textStyle = AppTextStyles();
    return TextTheme(
      bodyLarge: textStyle.bodyLg.copyWith(color: AppColors.primary),
      bodyMedium: textStyle.body.copyWith(color: AppColors.primary),
      titleMedium: textStyle.bodySm.copyWith(color: AppColors.primary),
      titleSmall: textStyle.bodyXs.copyWith(color: AppColors.primary),
      displayLarge: textStyle.h1.copyWith(color: AppColors.primary),
      displayMedium: textStyle.h2.copyWith(color: AppColors.primary),
      displaySmall: textStyle.h3.copyWith(color: AppColors.primary),
      headlineMedium: textStyle.h4.copyWith(color: AppColors.primary),
    );
  }
}


