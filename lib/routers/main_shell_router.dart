import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_cam/blocs/setting_bloc.dart';
import 'package:secret_cam/screens/settings_screen.dart';
import 'package:secret_cam/screens/home_screen.dart';
import 'package:secret_cam/screens/bottom_navigation_screen.dart';
import 'package:secret_cam/screens/media_screen.dart';
import 'package:secret_cam/screens/tutorial_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorMediaKey = GlobalKey<NavigatorState>(debugLabel: 'Media');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'Settings');

final mainShellRouter = GoRouter(
  initialLocation: '/settings',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BlocProvider<SettingBloc>(
            create: (context) => SettingBloc(),
            child: ButtonNavigation(navigationShell: navigationShell));
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: HomeScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'tutorial',
                  builder: (context, state) => TutorialScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMediaKey,
          routes: [
            GoRoute(
              path: '/media',
              pageBuilder: (context, state) => NoTransitionPage(
                child: MediaLibraryScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: SettingsScreen()),
            ),
          ],
        ),
      ],
    ),
  ],
);
