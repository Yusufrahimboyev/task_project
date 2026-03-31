import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:task_project/src/features/detail/screens/detail_screen.dart';

import '../../features/home/screens/home_screen.dart';
import '../../features/notifi/screens/notification_screen.dart';
import '../../features/search/screens/search_screen.dart';

class AppRouter {
  AppRouter._();

  static const String home = "/home";
  static const notifi = "/notification";
  static const search = "/search";
  static const detail = "/detail";
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: AppRouter.notifi,
  routes: [
    GoRoute(
      path: AppRouter.notifi,
      builder: (context, state) => NotificationScreen(),
    ),
    GoRoute(
      path: AppRouter.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRouter.search,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: AppRouter.detail,
      builder: (context, state) => const DetailScreen(),
    ),
  ],
);
