import 'package:flutter/material.dart';
import 'package:flutter_architecture/shared/responsive_adaptive/screen_size_type.dart';

class CustomLayoutBuilder extends StatelessWidget {
  
  final LayoutWidgetBuilder portraitBuilder;
  final LayoutWidgetBuilder? landscapeBuilder;
  

  const CustomLayoutBuilder({super.key, required this.portraitBuilder, this.landscapeBuilder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenSizeType screenSizeType = getScreenSizeTypeByContext(context);
        if (screenSizeType == ScreenSizeType.medium) {
          return portraitBuilder(context, constraints);
        } else {
          if(landscapeBuilder != null){
            return landscapeBuilder!(context, constraints);
          }else {
            return portraitBuilder(context, constraints);
          }
        }
      },
    );
  }
}
