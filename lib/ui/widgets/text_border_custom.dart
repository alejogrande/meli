import 'package:flutter/material.dart';

class TextBorderCustom extends StatelessWidget {
  final String text;
  final double? fontSize;

  const TextBorderCustom({
    required this.text,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: fontSize ?? 18,
        color: Colors.purple
      ),
    );
  }
}
