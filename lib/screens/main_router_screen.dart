import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_cam/blocs/setting_bloc.dart';
import 'package:secret_cam/screens/settings_screen.dart';
import 'package:secret_cam/screens/home_screen.dart';
import 'package:secret_cam/screens/media_screen.dart';
import 'package:secret_cam/screens/tutorial_screen.dart';

final GoRouter router = GoRouter(initialLocation: "/main", routes: [
  GoRoute(
    path: "/main",
    builder: ((BuildContext context, GoRouterState state) {
      return HomeScreen();
    }),
    routes: [
      GoRoute(
        path: 'config',
        builder: (BuildContext context, GoRouterState state) {
          return SettingsScreen();
        },
      ),
      GoRoute(
        path: 'media_library',
        builder: (BuildContext context, GoRouterState state) {
          return MediaLibraryScreen();
        },
      ),
      GoRoute(
        path: 'tutorial',
        builder: (BuildContext context, GoRouterState state) {
          return TutorialScreen();
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
    return MultiBlocProvider(
      providers: [
        // BlocProvider<SettingBloc>(
        //   create: (context) => SettingBloc(),
        // ),
        // Add more bloc providers as needed
      ],
      child: MaterialApp.router(
        routerConfig: router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
      ),
    );
  }
}