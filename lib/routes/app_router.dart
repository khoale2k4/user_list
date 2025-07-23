import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:user_list/screens/user_detail_screen.dart';
import 'package:user_list/screens/user_list_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/users',
          page: UserListRoute.page,
          initial: true,
        ),
        AutoRoute(
          path: '/users/:id',
          page: UserDetailRoute.page,
        ),
      ];
}
