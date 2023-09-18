// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUp extends StatelessWidget {
  RxBool isCheck = false.obs;
   final box = GetStorage();
 
  @override
  Widget build(BuildContext context) {
    var theme = box.read('theme');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(top: 100, left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppStrings.register,
                  style: AppStyles().signUpSignInTextStyle,
                ),
                40.ph,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    AppStrings.phoneNumber,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                15.ph,
                IntlPhoneField(
                  dropdownTextStyle: TextStyle(
                    fontSize: 17
                  ),
                  dropdownIconPosition: IconPosition.trailing,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.black,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(45.0)),
                    ),
                  ),
                ),
                10.ph,
                horseAppButton(AppStrings.register, () => Get.toNamed(signIn)),
                20.ph,
                RichText(
                        text: TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color:theme=='dark'?Colors.white: Colors.black
                            ),
                            children: [
                          TextSpan(
                            text: 'Sign In',
                            style: AppStyles().richTextStyle,
                            recognizer: TapGestureRecognizer()..onTap = () =>Get.toNamed(signIn)
                          ),
                        ])),
                        15.ph,
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: isCheck.value,
                          onChanged: (bool? val) {
                            isCheck.value = val!;
                          }),
                    ),
                    RichText(
                        text: TextSpan(
                            text: AppStrings.agreeWithPrivacy,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color:theme=='dark'?Colors.white: Colors.black
                            ),
                            children: [
                          TextSpan(
                            text: AppStrings.termsCondition,
                            style: AppStyles().richTextStyle,
                          ),
                        ])),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
