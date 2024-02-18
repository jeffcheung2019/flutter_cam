import 'package:flutter/material.dart';

class TakePhotoScreen extends StatefulWidget {
  const TakePhotoScreen({super.key});

  State<TakePhotoScreen> createState() => _TakePhotoScreenState();
}

class _TakePhotoScreenState extends State<TakePhotoScreen> {
  @override
  Widget build(BuildContext context) {
    print("TakePhotoScreen");

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(child: Text("Photo")),
    );
  }
}
