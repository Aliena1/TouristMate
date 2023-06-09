import 'package:flutter/material.dart';
import 'dart:ui';

class AppText extends StatelessWidget {
  AppText({Key? key, required this.text, this.size = 16,  this.color = Colors.black54}) : super(key: key);
  double size;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
      ),

    );
  }
}
