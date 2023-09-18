// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_colors.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';

class HomeDetailsScreen extends StatelessWidget {
  List _curselImages = [];
  var dotPosition = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(AppStrings.ad, style: AppStyles().appBarTextStyle),
        leading: IconButton(
            color: Colors.black,
            onPressed: ()=>Get.back(),
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(aspectRatio: 2,
              child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/horse.png"),
                                          fit: BoxFit.fitWidth)),
                                ),),
              // AspectRatio(
              //     aspectRatio: 2.0,
              //     child: CarouselSlider(
              //         items: _curselImages = [
              //           'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
              //           'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
              //           'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg'
              //         ]
              //             .map((item) => Padding(
              //                   padding: EdgeInsets.only(
              //                       top: 20.h, left: 10.w, right: 10.w),
              //                   child: Container(
              //                     decoration: BoxDecoration(
              //                         image: DecorationImage(
              //                             image: NetworkImage(item),
              //                             fit: BoxFit.fitWidth)),
              //                   ),
              //                 ))
              //             .toList(),
              //         options: CarouselOptions(
              //             autoPlay: false,
              //             enlargeCenterPage: true,
              //             viewportFraction: 0.8,
              //             enlargeStrategy: CenterPageEnlargeStrategy.height,
              //             onPageChanged: (val, CarouselPageChangedReason) {
              //               dotPosition.value = val;
              //             }))),
              8.ph,
              // Obx(
              //   () => Align(
              //     alignment: Alignment.center,
              //     child: DotsIndicator(
              //       dotsCount:
              //           _curselImages.length == 0 ? 1 : _curselImages.length,
              //       position: dotPosition.toDouble(),
              //       decorator: DotsDecorator(
              //         activeColor: AppColors.orangeColor,
              //         size: const Size.square(9.0),
              //         activeSize: const Size(18.0, 9.0),
              //         activeShape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5.0)),
              //       ),
              //     ),
              //   ),
              // ),
              15.ph,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.horsesForSale,
                    style: AppStyles().homeTextStyle,
                  ),
                  Text(
                    AppStrings.aed,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.horseButtonColor),
                  )
                ],
              ),
              20.ph,
              customRow(AppStrings.horseAge, AppStrings.twentyFour),
              customRow(AppStrings.horsePrice, AppStrings.aedd),
              customRow(AppStrings.breed, AppStrings.breedd),
              customRow(AppStrings.horseHight, AppStrings.hight),
              customRow(AppStrings.horseType, AppStrings.male),
              25.ph,
              Text(AppStrings.detail,style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              )),
              10.ph,
              Wrap(
                children: [
                  Text(AppStrings.textAll,style:TextStyle(fontSize:13.sp,),),
                ],
              ),
              10.ph,
              Container(
                height: 50.h,width:160.w,
                decoration: BoxDecoration(
                  color: Color(0xFF00D98B),
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Image.asset("assets/images/img-removebg-preview.png"),
                      Text(AppStrings.whatsapp,
                        style:AppStyles().homeTextStyle,),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

Widget customRow(String title, String title2) {
  return Padding(
    padding: EdgeInsets.only(top: 20.h, right: 20.w),
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          title2,
          style: TextStyle(
            color: Color(0xFF222222),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
