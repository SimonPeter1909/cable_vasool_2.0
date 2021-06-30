import 'package:auto_route/auto_route.dart';
import 'package:cable_vasool/pages/dashboard/dashboard_page.dart';
import 'package:cable_vasool/pages/login_page/login_page.dart';
import 'package:cable_vasool/pages/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';

@MaterialAutoRouter(routes: [
  CustomRoute(
      page: SplashScreen,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn),
  CustomRoute(
      page: LoginPage,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
  CustomRoute(
      page: DashboardPage,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade)
])
class $AppRouter {}
