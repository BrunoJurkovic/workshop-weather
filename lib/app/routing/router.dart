import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weatherworkshop/counter/view/home.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(
      page: HomeScreen,
      initial: true,
    )
  ],
)
// Extend the generated private router
class AppRouter extends _$AppRouter {}
