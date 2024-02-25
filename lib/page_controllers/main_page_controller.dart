import 'package:flutter/material.dart';
import 'package:secret_cam/screens/home_screen.dart';
import 'package:secret_cam/screens/bottom_navigation_screen.dart';
import 'package:secret_cam/screens/take_photo_screen.dart';
import 'package:secret_cam/screens/take_video_screen.dart';

class MainPageController extends StatefulWidget {
  const MainPageController({super.key});

  @override
  _MainPageControllerState createState() => _MainPageControllerState();
}

class _MainPageControllerState extends State<MainPageController> {
  final PageController _pageController = PageController(initialPage: 1);
  final List<Widget> _pages = [
    const TakePhotoScreen(),
    ButtonNavigationScreen(),
    const TakeVideoScreen(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // Swipe from left to right
          if (_pageController.page!.toInt() > 0) {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          }
        } else if (details.primaryVelocity! < 0) {
          // Swipe from right to left
          if (_pageController.page!.toInt() < _pages.length - 1) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          }
        }
      },
      child: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
    );
  }
}
