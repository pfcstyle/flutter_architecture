import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ScreenSizeType { medium, large, extraLarge }

ScreenSizeType getScreenSizeTypeByContext(BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  return getScreenSizeTypeBySize(screenSize);
}

ScreenSizeType getScreenSizeTypeBySize(Size size) {
  if(size.width > 600){return ScreenSizeType.large;}
  return ScreenSizeType.medium;
}

Size getDesignSize(BuildContext context){
  switch(getScreenSizeTypeByContext(context)){
    case ScreenSizeType.medium:
      return const Size(375, 667);
    case ScreenSizeType.large:
    case ScreenSizeType.extraLarge:
      return const Size(1024, 1366);
    default:
      return ScreenUtil.defaultSize;
  }
}

Size getDisableScaleDesignSize(BuildContext context){
  return MediaQuery.of(context).size;
}
