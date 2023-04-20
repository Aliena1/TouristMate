import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_mate/constants/app_colors.dart';
import 'package:tourist_mate/widgets/app_large_text.dart';
import 'package:tourist_mate/widgets/responsive_button.dart';

import '../cubit/app_cubits.dart';
import '../widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img.png",
    "img_1.png",
    "img.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_,index){
          return Container(
            // margin: EdgeInsets.only(top: 40),
            // width: double.maxFinite,
            // height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/"+images[index]),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: EdgeInsets.only(top: 150,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain",size: 30,),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: AppText(
                          text: "Mountain hikes give you an incredible sense of freedom along with endurance test",
                          color: AppColors.subTextColor,
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                            width: 200,
                            child: Row(
                              children: [
                                ResponsiveButton(width: 120,),
                              ],
                            )),
                      ),


                    ],
                  ),
                  Column(
                    children:
                      List.generate(3, (indexDots) {
                       return Container(
                         margin: EdgeInsets.only(bottom: 2),
                         width: 8,
                         height: index==indexDots?25:8,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(8),
                           color: index==indexDots?AppColors.themeColor:AppColors.themeColor.withOpacity(0.3)
                         ),
                       );
                      })
                  )
                ],
              ),
            ),
          );

      }),
    );
  }
}
