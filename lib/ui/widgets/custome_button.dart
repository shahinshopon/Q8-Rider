import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/const/app_colors.dart';

Widget horseAppButton(
    String title,
    onPressed,
    ) {
  return Container(
    height: 50.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15.r)),
    ),
    child: Material(
      borderRadius: BorderRadius.all(Radius.circular(15.r)),
      color: AppColors.horseButtonColor,
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.white,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 22.sp),
          ),
        ),
      ),
    ),
  );
}

