import 'package:flutter/material.dart';

enum ScreenSize { medium, large, extraLarge }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  // if (deviceWidth > 900) return ScreenSize.extraLarge;
  if (deviceWidth > 600) return ScreenSize.large;
  // if (deviceWidth > 300) return ScreenSize.medium;
  return ScreenSize.medium;
}