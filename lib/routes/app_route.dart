import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_architecture/features/activity/presentation/screens/activity_screen.dart';
import 'package:flutter_architecture/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter_architecture/features/index/presentation/index_screen.dart';
import 'package:flutter_architecture/features/me/presentation/screens/me_screen.dart';
import 'package:flutter_architecture/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter_architecture/features/workspace/presentation/screens/workspace_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter implements AutoRouteGuard {
// @override
// replaceInRouteName

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
      // if(isAuthenticated || resolver.route.name == LoginRoute.name){
      //    // we continue navigation
      //     resolver.next();
      // }else{
      //     // else we navigate to the Login page so we get authenticateed
      //     push(LoginRoute(onResult:(didLogin)=> resolver.next(didLogin)))
      // }
      resolver.next();
   }

  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        // RedirectRoute(path: '/', redirectTo: IndexRoute.name),   
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: IndexRoute.page, children: [
          AutoRoute(page: WorkspaceRoute.page),
          AutoRoute(page: ActivityRoute.page),
          AutoRoute(page: MeRoute.page),
        ]),
        // AutoRoute(path: '/books/:id', page: BookDetailsPage),
      ];
}
