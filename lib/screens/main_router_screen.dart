import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_cam/screens/settings_screen.dart';
import 'package:secret_cam/screens/home_screen.dart';
import 'package:secret_cam/screens/media_screen.dart';
import 'package:secret_cam/screens/tutorial_screen.dart';

final GoRouter router = GoRouter(initialLocation: "/main", routes: [
  GoRoute(
    path: "/main",
    builder: ((BuildContext context, GoRouterState state) {
      return const HomeScreen();
    }),
    routes: [
      GoRoute(
        path: 'config',
        builder: (BuildContext context, GoRouterState state) {
          return const SettingsScreen();
        },
      ),
      GoRoute(
        path: 'media_library',
        builder: (BuildContext context, GoRouterState state) {
          return const MediaLibraryScreen();
        },
      ),
      GoRoute(
        path: 'tutorial',
        builder: (BuildContext context, GoRouterState state) {
          return const TutorialScreen();
        },
      ),
    ],
  )
]);

class MainRouterScreen extends StatefulWidget {
  const MainRouterScreen({super.key});

  State<MainRouterScreen> createState() => _MainRouterScreenState();
}

class _MainRouterScreenState extends State<MainRouterScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
    );
  }
}
