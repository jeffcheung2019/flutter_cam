import 'package:flutter/material.dart';

class CustomPicker extends StatelessWidget {
  final List<String> texts;

  CustomPicker({required this.texts});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: texts.map((text) {
        return Row(
          children: [
            Icon(Icons.arrow_forward),
            SizedBox(width: 8.0),
            Text(text),
          ],
        );
      }).toList(),
    );
  }
}
