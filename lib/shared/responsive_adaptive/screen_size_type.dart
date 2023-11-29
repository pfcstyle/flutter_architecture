import 'package:flutter/material.dart';

enum ScreenSizeType { medium, large, extraLarge }

ScreenSizeType getScreenSizeTypeByContext(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return getScreenSizeTypeBySize(screenSize);
}

ScreenSizeType getScreenSizeTypeBySize(Size size) {
  if(size.width > 600){return ScreenSizeType.large;}
  return ScreenSizeType.medium;
}
