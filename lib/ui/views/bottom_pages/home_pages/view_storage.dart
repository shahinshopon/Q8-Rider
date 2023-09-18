// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_colors.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';

class ViewStoresScreen extends StatefulWidget {
  @override
  State<ViewStoresScreen> createState() => _ViewStoresScreenState();
}

class _ViewStoresScreenState extends State<ViewStoresScreen> {
  final List<Map<String, String>> storageItems = [
    {
      'text': 'Hosrsename',
      'male': 'Male',
      'reviews': '(233) Reviews',
      'open': 'Open',
      'image': 'assets/images/horse1.png',
      'time': '08:00 - 20:00',
    },
    {
      'text': 'Hosrsename',
      'male': 'Male',
      'reviews': '(233) Reviews',
      'open': 'Open',
      'image': 'assets/images/horse1.png',
      'time': '08:00 - 20:00',
    },
    {
      'text': 'Hosrsename',
      'male': 'Male',
      'reviews': '(233) Reviews',
      'open': 'Open',
      'image': 'assets/images/horse1.png',
      'time': '08:00 - 20:00',
    },
    {
      'text': 'Hosrsename',
      'male': 'Male',
      'reviews': '(233) Reviews',
      'open': 'Open',
      'image': 'assets/images/horse1.png',
      'time': '08:00 - 20:00',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 200.h,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/horse.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(alignment: Alignment.topLeft,
                    child: IconButton(onPressed: (){
                      Get.back();
                    }, icon: Icon(Icons.arrow_back,color: Colors.white,))),
                  SizedBox(height: 20,),
                  Text(
            "Stores",
            style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
          ),
                ],
              )),
        ),
        20.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Stores',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  color: AppColors.horseButtonColor,
                  fontSize: 14,
                  fontFamily: 'Nunito Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Text(
            '123 Popular Stores',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF404B52)),
          ),
        ),
    //    20.ph,
        Expanded(child: storageView(storageItems)),
      ],
    ));
  }
}

ListView storageView(storageItems) {
  return ListView.builder(
    //shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: storageItems.length,
    itemBuilder: (_, index) {
      return Padding(
        padding: EdgeInsets.only(right: 8.w, left: 8.w,bottom: 8),
        child: SizedBox(
          height: 120.h,
          width: double.maxFinite,
          child: Row(
            children: [
              SizedBox(
                height: 120.h,
                width: 120.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    bottomLeft: Radius.circular(25.r),
                  ),
                  child: Image.asset(
                    storageItems[index]['image'].toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              15.pw,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              storageItems[index]["text"],
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF454F63)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 7),
                              child: Text(
                                storageItems[index]["male"],
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF78849E)),
                              ),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 4.r,
                                ),
                                 SizedBox(width: 5,),
                                Text(
                                  storageItems[index]["open"].toString(),
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF454F63)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            itemSize: 15.w,
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Padding(
                           padding: const EdgeInsets.symmetric(vertical: 7),
                            child: Text(
                              storageItems[index]["reviews"].toString(),
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF454F63)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 15.w,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                storageItems[index]["time"].toString(),
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF454F63)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(storageScreen),
                    child: Container(
                      height: 26.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                          color: AppColors.horseButtonColor,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Center(
                        child: Text(
                          "Visit Store",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [

// 10.pw,
// Text(storageItems[index]["subtitle2"],
// style: AppStyles().textFieldOutText),
// ],
// ),
// Text(
// storageItems[index]["subtitle1"],
// style: AppStyles().horseSallTextStyle,
// ),
// Text(
// storageItems[index]["subtitle1"],
// style: AppStyles().richTextStyle,
// ),
// ],
// ),
