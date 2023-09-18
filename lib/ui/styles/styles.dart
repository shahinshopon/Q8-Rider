// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:practice/const/app_colors.dart';

class AppStyles {
  TextStyle richTextStyle =
  TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.horseButtonColor,
  );
  TextStyle signUpSignInTextStyle =
  TextStyle(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
  );
  TextStyle textFieldOutText =
  TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
  );
  TextStyle homeTextStyle =
  TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  TextStyle horseSallTextStyle =
  TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
  );
  TextStyle appBarTextStyle =
  TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
}