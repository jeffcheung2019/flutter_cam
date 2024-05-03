import 'package:flutter/material.dart';
import 'package:secret_cam/page_controllers/main_page_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('zh'), // Chinese
          Locale('ja'), // Japanese
        ],
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.deepPurpleAccent,
        ),
        home: MainPageController());
  }
}
