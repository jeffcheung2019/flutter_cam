import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:secret_cam/page_controllers/main_page_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurpleAccent,
        ),
        home: MainPageController()
    );
  }
}
