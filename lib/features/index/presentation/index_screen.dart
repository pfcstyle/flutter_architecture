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
                  icon: Image.asset('assets/images/index/ws_icon.png', width: 20, height: 20), label: 'Workspace', activeIcon: Image.asset('assets/images/index/ws_icon_selected.png', width: 20, height: 20)),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/images/index/ws_icon.png', width: 20, height: 20), label: 'Activity', activeIcon: Image.asset('assets/images/index/activity_icon_selected.png', width: 20, height: 20)),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/images/index/me_icon.png', width: 20, height: 20), label: 'Me', activeIcon: Image.asset('assets/images/index/me_icon_selected.png', width: 20, height: 20)),
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
