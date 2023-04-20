import 'package:flutter/material.dart';
import 'package:tourist_mate/widgets/app_text.dart';

import '../constants/app_colors.dart';

class AppButtons extends StatelessWidget {
  AppButtons({Key? key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.color,
    required this.bgColor,
    required this.borderColor,
    required this.size,
  }) : super(key: key);
  final Color color;
  final Color bgColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? icon;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
          color: bgColor,

      ),
      child: isIcon==false?Center(child: AppText(text: text!,color: Colors.black,)):Center(child: Icon(icon,color: color,)),
    );
  }
}
