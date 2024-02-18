import 'package:flutter/material.dart';

class TakeVideoScreen extends StatefulWidget {
  const TakeVideoScreen({super.key});

  State<TakeVideoScreen> createState() => _TakeVideoScreenState();
}

class _TakeVideoScreenState extends State<TakeVideoScreen> {
  @override
  Widget build(BuildContext context) {
    print("TakeVideoScreen");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: Text("Video")),
    );
  }
}
