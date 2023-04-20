import 'package:flutter/material.dart';
import 'dart:ui';

class AppLargeText extends StatelessWidget {
   AppLargeText({Key? key, required this.text, this.size = 30,  this.color = Colors.black}) : super(key: key);
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
        fontWeight: FontWeight.bold
      ),

    );
  }
}
