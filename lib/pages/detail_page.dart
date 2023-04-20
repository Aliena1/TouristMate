import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_mate/constants/app_colors.dart';
import 'package:tourist_mate/cubit/app_cubit_states.dart';
import 'package:tourist_mate/cubit/app_cubits.dart';
import 'package:tourist_mate/widgets/app_buttons.dart';
import 'package:tourist_mate/widgets/app_large_text.dart';
import 'package:tourist_mate/widgets/app_text.dart';
import 'package:tourist_mate/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubits,CubitStates>(builder: (context,state){
      DetailState detailState = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detailState.places.img),
                            fit: BoxFit.cover
                        )
                    ),
                  )
              ),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        BlocProvider.of<AppCubits>(context).goHome();
                      }, icon: Icon(Icons.menu),color: Colors.white,),
                    ],
                  )),
              Positioned(
                  top: 320,
                  child: Container(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(text: detailState.places.name,color: Colors.black.withOpacity(0.8),),
                            AppLargeText(text: "\$"+detailState.places.price.toString(),color: AppColors.themeColor),

                          ],
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Icon(Icons.location_on,color: AppColors.themeColor,),
                            Text(detailState.places.location,style: TextStyle(color: AppColors.themeColor),)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(5, (index){
                                  return Icon(Icons.star,color: index<gottenStars?Colors.orangeAccent:Colors.black54,);
                                })
                            ),
                            AppText(text: detailState.places.stars.toString(),color: AppColors.subTextColor,)
                          ],
                        ),
                        SizedBox(height: 30,),
                        AppLargeText(text: "People",color: Colors.black,size: 20,),
                        AppText(text: "Number of people in your group",color: Colors.black54,size: 16,),
                        SizedBox(height: 5,),
                        Wrap(
                            children: List.generate(5, (index) {
                              return AppButtons(color: Colors.white,
                                bgColor: AppColors.buttonBg,
                                borderColor: AppColors.buttonBg, size: 50,
                                text: (index+1).toString(),

                              );
                            })
                        ),
                        SizedBox(height: 8,),
                        AppLargeText(text: "Description",color: Colors.black,size: 20,),
                        AppText(text: detailState.places.description,color: Colors.black54,size: 16,),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child:Row(
                    children: [
                      AppButtons(color: AppColors.themeColor, bgColor: Colors.white,
                        borderColor: AppColors.themeColor,icon: Icons.favorite_border,isIcon: true, size: 50,),
                      SizedBox(width: 20,),
                      ResponsiveButton(
                        isResponsive: true,

                      )
                    ],
                  )

              ),
            ],
          ),
        ),
      );
    });
  }
}
