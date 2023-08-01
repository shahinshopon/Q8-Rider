import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_colors.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/views/bottom_nav_controller.dart';

Widget customButton(
  String title,
  onPressed,
) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: AppColors.mandarinColor,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        fontSize: 16.sp,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30),
    ),
    child: Text(title),
  );
}

Widget closeButton(indexNumber) {
  return IconButton(
      onPressed: () {
        Get.toNamed(bottomNav,arguments: BottomNavController(selectedIndex: indexNumber));
      },
      icon: Icon(
        Icons.close,
        size: 35,
        color: Colors.black,
      ));
}

