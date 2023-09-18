// ignore_for_file: prefer_final_fields

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_colors.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/views/bottom_pages/hores_for_sell.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';

class BottomHomePage extends StatelessWidget {
  List items = [
    {
      'images': "assets/images/horse.png",
      'title': "Quam",
    },
    {
      'images': "assets/images/horse.png",
      'title': "Quam",
    },
    {
      'images': "assets/images/horse.png",
      'title': "Quam",
    },
    {
      'images': "assets/images/horse.png",
      'title': "Quam",
    },
  ];
  List horseSaleData = [
    {
      'images': "assets/images/horse.png",
      'male': "Male",
      'time': "4hr ago",
      'horseName': "Quam",
      'number': "2000AED"
    },
    {
      'images': "assets/images/horse1.png",
      'male': "Male",
      'time': "4hr ago",
      'horseName': "HorsesName",
      'number': "2000AED"
    },
    {
      'images': "assets/images/horse1.png",
      'male': "Male",
      'time': "4hr ago",
      'horseName': "HorsesName",
      'number': "2000AED"
    },
  ];
  List _curselImages = [];
  var dotPosition = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,top: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                      aspectRatio: 2.0,
                      child: CarouselSlider(
                          items: _curselImages = [
                            'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
                            'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
                            'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg'
                          ]
                              .map((item) => Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.h, left: 10.w, right: 10.w),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(item),
                                              fit: BoxFit.fitWidth)),
                                    ),
                                  ))
                              .toList(),
                          options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 0.8,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              onPageChanged: (val, CarouselPageChangedReason) {
                                dotPosition.value = val;
                              }))),
                  8.ph,
                  Obx(
                    () => Align(
                      alignment: Alignment.center,
                      child: DotsIndicator(
                        dotsCount:
                            _curselImages.length == 0 ? 1 : _curselImages.length,
                        position: dotPosition.toDouble(),
                        decorator: DotsDecorator(
                          activeColor: AppColors.orangeColor,
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                  15.ph,
                  Text(
                    AppStrings.categories,
                    style: AppStyles().homeTextStyle,
                  ),
                  10.ph,
                  SizedBox(height: 110.h, child: Categories(items)),
                  20.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.horsesForSale,
                        style: AppStyles().homeTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: InkWell(
                           onTap: () => Get.to(HorseForSellScreen(data: horseSaleData)
                           ),
                          child: Text(
                            AppStrings.viewAll,
                            style: AppStyles().textFieldOutText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.ph,
                  InkWell(
                      onTap: () => Get.toNamed(horseSell),
                      child: SizedBox(
                          height: 170.h, child: HorsesForsale(horseSaleData))),
                  10.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.stores,
                        style: AppStyles().homeTextStyle,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(stores),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Text(
                            AppStrings.viewAll,
                            style: AppStyles().textFieldOutText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.ph,
                  SizedBox(height: 170.h, child: HorsesForsale(horseSaleData)),
                  10.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.bestSeller,
                        style: AppStyles().homeTextStyle,
                      ),
                      GestureDetector(
                        onTap: () =>
                            Get.toNamed(bestSeller, arguments: horseSaleData),
                        child: Padding(
                         padding: const EdgeInsets.only(right: 7),
                          child: Text(
                            AppStrings.viewAll,
                            style: AppStyles().textFieldOutText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.ph,
                  SizedBox(height: 170.h, child: HorsesForsale(horseSaleData)),
                  10.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.femaleRiders,
                        style: AppStyles().homeTextStyle,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(femaleRiderScreen,
                            arguments: horseSaleData),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Text(
                            AppStrings.viewAll,
                            style: AppStyles().textFieldOutText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.ph,
                  SizedBox(height: 170.h, child: HorsesForsale(horseSaleData)),
                ],
              ),
            ),
          )),
    );
  }
}

ListView Categories(items) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: items.length,
    itemBuilder: (_, index) {
      return Padding(
        padding: EdgeInsets.only(right: 10.w),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: Container(
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  color: Color(0xFfC4C4C4),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(items[index]['images']),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Text(
              items[index]["title"],
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );
    },
  );
}

ListView HorsesForsale(horseSale) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: horseSale.length,
    itemBuilder: (_, index) {
      return Padding(
        padding: EdgeInsets.only(right: 6.w),
        child: SizedBox(
          height: 165.h,
          width: 160.w,
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 AspectRatio(
                      aspectRatio: 2.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          horseSale[index]['images'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            horseSale[index]["male"],
                              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                          ),
                          10.pw,
                          Text(horseSale[index]["time"],
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),),
                        ]
                      ),
                      Text(
                        horseSale[index]["horseName"],
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        horseSale[index]["number"],
                        style: AppStyles().richTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
