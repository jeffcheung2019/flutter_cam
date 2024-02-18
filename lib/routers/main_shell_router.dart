import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ButtonNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: HomeScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'tutorial',
                  builder: (context, state) => const TutorialScreen(),
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
              pageBuilder: (context, state) => const NoTransitionPage(
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
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
