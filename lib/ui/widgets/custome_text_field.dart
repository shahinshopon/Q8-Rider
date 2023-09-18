
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customFormField(
    keyboardtype,
    controller,
    context,
    hinttext,
    validator, {
      bool obscureText = false,
      suffixIcon,
      prefixIcon,
      prefixStyle,
      readOnly = false,
    }) {
  return Padding(
    padding: EdgeInsets.only(bottom: 15.h),
    child: TextFormField(
      keyboardType: keyboardtype,
      readOnly: readOnly,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w400,
      ),
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      validator: validator,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(15, 15, 20, 15),
        suffixIcon: suffixIcon,
        prefix: prefixIcon,
        prefixStyle: prefixStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        hintText: hinttext,
        hintStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

//--------------------------
Widget customTextField(title, controller, hintText) {
  return Padding(
    padding: EdgeInsets.only(top: 10.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            )),
        const SizedBox(height: 5,),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )),
        ),
      ],
    ),
  );
}