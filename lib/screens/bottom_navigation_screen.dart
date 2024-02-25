import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_cam/routers/main_shell_router.dart';
import 'package:secret_cam/screens/settings_screen.dart';
import 'package:secret_cam/screens/home_screen.dart';
import 'package:secret_cam/screens/media_screen.dart';
import 'package:secret_cam/screens/tutorial_screen.dart';

class ButtonNavigationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: mainShellRouter,
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ButtonNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            // the appearance of each tab is defined with a [NavigationDestination] widget
            NavigationDestination(label: '', icon: Icon(Icons.home)),
            NavigationDestination(label: '', icon: Icon(Icons.insert_photo)),
            NavigationDestination(label: '', icon: Icon(Icons.settings)),
          ],
          onDestinationSelected: _goBranch),
    );
  }
}
