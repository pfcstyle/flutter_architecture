import 'package:flutter_architecture/gen/assets.gen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/routes/app_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class IndexScreen extends ConsumerWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // we'll use [AutoTabsRouter] to handle tab navigation
    return AutoTabsRouter(
      // list of your tab routes
      routes: const [WorkspaceRoute(), ActivityRoute(), MeRoute()],
      transitionBuilder: (context, child, animation) {
        // add animation to our selected-tab page
        return FadeTransition(opacity: animation, child: child);
      },
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        // [ScaffoldWithNavbar] is simple a widget that return a Scaffold
        // and set active route on BottomNavigationBar Tap
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Assets.images.index.wsIcon.image(width: 20, height: 20), label: 'Workspace', activeIcon: Assets.images.index.wsIconSelected.image(width: 20, height: 20)),
              BottomNavigationBarItem(
                  icon: Assets.images.index.activityIcon.image(width: 20, height: 20), label: 'Activity', activeIcon: Assets.images.index.activityIconSelected.image(width: 20, height: 20)),
              BottomNavigationBarItem(
                  icon: Assets.images.index.meIcon.image(width: 20, height: 20), label: 'Me', activeIcon: Assets.images.index.meIconSelected.image(width: 20, height: 20)),
            ],
            onTap: (index) {
              // change current tab
              tabsRouter.setActiveIndex(index);
            },
          ),
          body: child,
        );
      },
    );
  }
}
