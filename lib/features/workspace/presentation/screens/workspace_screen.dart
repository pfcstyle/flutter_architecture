import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/shared/responsive_adaptive/widget/custom_layout_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class WorkspaceScreen extends ConsumerWidget {
  const WorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workspace", style: Theme.of(context).textTheme.bodyMedium,),
      ),
      body: CustomLayoutBuilder(
        portraitBuilder: (BuildContext context, BoxConstraints constraints) {
          return Column(children: [
            Text("tex1", style: TextStyle(color: Colors.black, fontSize: 20.sp),), 
            Text("text2", style: Theme.of(context).textTheme.bodyLarge,)
          ],);
        },
        landscapeBuilder: (context, constraints){
          return Row(children: [
            Text("tex1", style: TextStyle(color: Colors.black, fontSize: 20.sp),), 
            Text("text2", style: Theme.of(context).textTheme.bodyLarge,)
          ],);
        },)
    );
  }
}