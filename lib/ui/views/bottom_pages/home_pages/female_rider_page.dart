// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';

class FemaleRiderScreen extends StatelessWidget {
  var data;
  FemaleRiderScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:
            Text(AppStrings.FemaleRiders, style: AppStyles().appBarTextStyle),
        leading: IconButton(
            color: Colors.black,
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: SizedBox(
                  height: 160.h,
                  width: 140.w,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                           child: AspectRatio(
                                aspectRatio: 2.0,
                                child: Image.asset(
                                  data[index]['images'],
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                         ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data[index]["male"],
                                    style: AppStyles().textFieldOutText,
                                  ),
                                  10.pw,
                                  Text(data[index]["time"],
                                      style: AppStyles().textFieldOutText),
                                ],
                              ),
                              Text(
                                data[index]["horseName"],
                                style: AppStyles().horseSallTextStyle,
                              ),
                              Text(
                                data[index]["number"],
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
            }),
      )),
    );
  }
}
