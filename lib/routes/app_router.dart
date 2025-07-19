import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/user_list_screen.dart';
import '../screens/user_detail_screen.dart';

enum Path {
  users,
  detail;
}

final GoRouter router = GoRouter(
  initialLocation: '/users',
  routes: [
    GoRoute(
      path: '/users',
      name: 'userList',
      builder: (context, state) => const UserListScreen(),
    ),
    GoRoute(
      path: '/users/:id',
      name: 'userDetail',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return UserDetailScreen(userId: id);
      },
    ),
  ],
);

void routePush(BuildContext context, Path path, {String? id}) {
  if(path == Path.users) {
    context.goNamed('userList');
  } else if (path == Path.detail) {
    context.goNamed('userDetail', pathParameters: {'id': id.toString()});
  }
}
