import 'package:flutter/material.dart';

extension ExtendColorScheme on ColorScheme {
  //Theme.of(context).colorScheme.customColor1,
  Color get customColor1 => autoChange(AppColors.primary, AppColors.primaryDrak);

  Color autoChange(Color lightColor, Color darkColor){
    return brightness == Brightness.light ? lightColor : darkColor;
  }
}

class AppColors {
  /// App primary color
  static const Color primary = Color(0xff1DA1F2);
  static const Color primaryDrak = Color(0xff14171A);

  /// App secondary color
  static const Color error = Color(0xffFC698C);

  /// App black color
  static const Color black = Color(0xff14171A);

  /// App white color
  static const Color white = Color(0xffffffff);

  /// Light grey color
  static const Color lightGrey = Color(0xffAAB8C2);

  /// Extra Light grey color
  static const Color extraLightGrey = Color(0xffE1E8ED);
}
