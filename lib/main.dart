import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_number/pages/DefeatPage.dart';
import 'package:guess_number/pages/GamePage.dart';
import 'package:guess_number/pages/MainPage.dart';
import 'package:guess_number/pages/VictoryPage.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainPage();
      },
    ),
    GoRoute(
        path: '/game',
        builder: (BuildContext context, GoRouterState state) {
          return const GamePage();
        }),
    GoRoute(
      path: '/victory',
      builder: (BuildContext context, GoRouterState state) {
        return const VictoryPage();
      },
    ),
    GoRoute(
      path: '/defeat',
      builder: (BuildContext context, GoRouterState state) {
        return const DefeatPage();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue,
        ));
  }
}
