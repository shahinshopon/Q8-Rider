// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/views/bottom_pages/bottom_home_page.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';

class StorageScreen extends StatelessWidget {
  List storageData = [
    {
      'images': "assets/images/horse.png",
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
    {
      'images': "assets/images/horse1.png",
      'male': "Male",
      'time': "4hr ago",
      'horseName': "HorsesName",
      'number': "2000AED"
    },
  ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

       elevation: 0,
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: NestedScrollView(
        controller: ScrollController(keepScrollOffset: true),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hi Username!",
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notification_add_outlined,
                                  size: 20.w,
                                ))
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16.w,
                            ),
                            Text(
                              "Location, Main City-Napgur",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 16.w,
                            ),
                          ],
                        ),
                        10.ph,
                        SizedBox(
                          height: 45.h,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 20.w,
                              ),
                              filled: true,
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400),
                              hintText: "Search",
                            ),
                          ),
                        ),
                        10.ph,
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            SizedBox(
                                height: 150.h,
                                width: double.maxFinite,
                                child: Image.asset(
                                  "assets/images/horse.png",
                                  fit: BoxFit.fill,
                                )),
                            Positioned(
                                child: Padding(
                                  padding: EdgeInsets.only(left:10.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Get Special Discount",
                                        style: TextStyle(
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                      Text("up to 75%",style: TextStyle(
                                          fontSize: 32.sp,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFF5F5F5)),),
                                      Container(
                                          height: 26.h,
                                          width: 125.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(25.r)
                                          ),
                                          child: Center(
                                            child: Text("Grab the Deal",style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                            )),
                                          )),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        15.ph,
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                        AppStrings.categories,
                        style: AppStyles().homeTextStyle,
                      ),
                       Padding(
                         padding: const EdgeInsets.only(right:8.0),
                         child: Text(
                           AppStrings.viewAll,
                           style: AppStyles().textFieldOutText,
                         ),
                       ),
                ],
              ),
                  10.ph,
              SizedBox(height: 110.h, child: Categories(items)),
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: storageData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 1),
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               AspectRatio(
                                    aspectRatio: 2.0,
                                    child: Image.asset(
                                      storageData[index]['images'],
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          storageData[index]["male"],
                                          style: AppStyles().textFieldOutText,
                                        ),
                                        10.pw,
                                        Text(storageData[index]["time"],
                                            style: AppStyles().textFieldOutText),
                                      ],
                                    ),
                                    Text(
                                      storageData[index]["horseName"],
                                      style: AppStyles().horseSallTextStyle,
                                    ),
                                    Text(
                                      storageData[index]["number"],
                                      style: AppStyles().richTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
