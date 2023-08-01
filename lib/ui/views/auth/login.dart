
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_colors.dart';
import 'package:practice/ui/responsive/size_config.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/widgets/custom_button.dart';

import '../../widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: SizeConfig.screenHeight,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/icons/logo.png',
                    width: 40.w,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Log In',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customFormField(TextInputType.emailAddress, _emailController,
                      context, 'Email', (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    if (!val.contains(RegExp(r'\@'))) {
                      return 'enter a valid email address';
                    }
                  }, prefixIcon: Icons.email_outlined),
                  customFormField(TextInputType.text, _passwordController,
                      context, 'Password', (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                  },
                      prefixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Get.toNamed(forgetPass),
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Log in',
                        () {
                          if (_formKey.currentState!.validate()) {
                            Get.toNamed(bottomNav);
                          } else {
                            print('failed');
                          }
                        },
                      )),
                  
                  
                  const SizedBox(
                    height: 30,
                  ),
                  Text.rich(TextSpan(children: [
                    const TextSpan(
                        text: 'Don\'t have an account?',
                        style: TextStyle(color: AppColors.grayColor)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(registration),
                        text: ' Sign Up',
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                  ]))
                ],
              ),
            ),
          ),
        ),
      )),
    
    );
  }
}
