import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_str_picker/main.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MyHomePage();
      },
    ),
  ],
);
