import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Don't use static properties, because they will be loaded
///before screenutil, xx.sp is invalid
class AppTextStyles {
  // static const String fontFamily = 'Helvetica';
  static String fontFamily = 'Avenir';

  /// Text style for body
  TextStyle bodyLg = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  TextStyle body = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  TextStyle bodySm = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
  );

  TextStyle bodyXs = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w300,
  );

  /// Text style for heading

  TextStyle h1 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );

  TextStyle h2 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  TextStyle h3 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  TextStyle h4 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
}
