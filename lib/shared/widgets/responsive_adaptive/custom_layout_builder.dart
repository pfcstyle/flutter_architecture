import 'package:flutter/material.dart';
import 'package:flutter_architecture/shared/widgets/responsive_adaptive/screen_size.dart';

// TODO: APP层面集成flutter_screenutil
// 尝试扩展flutter_screenutil进ScreenSize
// 与text theme集成
// 根据design，集成colors和fonts
class CustomLayoutBuilder extends StatelessWidget {
  
  final LayoutWidgetBuilder portraitBuilder;
  final LayoutWidgetBuilder? landscapeBuilder;
  

  const CustomLayoutBuilder({super.key, required this.portraitBuilder, this.landscapeBuilder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        ScreenSize screenSize = getSize(context);
        if (screenSize == ScreenSize.medium) {
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
