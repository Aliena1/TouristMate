import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourist_mate/constants/app_colors.dart';
import 'package:tourist_mate/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width=120, this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.themeColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?AppText(text: "Book Trip Now",color: Colors.white,):Container(),
            Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 10,),
            Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 15,),
            Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 20,),
          ],
        ),
      ),
    );
  }
}
