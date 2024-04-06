import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  TutorialScreen({super.key});

  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tutorial"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue,
      body: Center(child: Text("###")),
    );
  }
}
