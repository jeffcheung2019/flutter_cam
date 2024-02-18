import 'package:flutter/material.dart';

class MediaLibraryScreen extends StatefulWidget {
  const MediaLibraryScreen({super.key});

  State<MediaLibraryScreen> createState() => _MediaLibraryScreenState();
}

class _MediaLibraryScreenState extends State<MediaLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Media"),
        centerTitle: true,
      ),
      backgroundColor: Colors.green,
      body: Center(child: Text("###")),
    );
  }
}
