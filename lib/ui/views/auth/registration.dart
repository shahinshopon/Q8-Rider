import 'package:animated_radio_buttons/animated_radio_buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_colors.dart';
import 'package:practice/ui/responsive/size_config.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/widgets/custom_button.dart';
import 'package:practice/ui/widgets/custom_text_field.dart';

class Registration extends StatefulWidget {
  Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  int _genderValue = 0;
  int _ageGroupValue = 0;

  // RxBool _value = false.obs;
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
                    'Sign Up',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customFormField(
                      TextInputType.text, _nameController, context, 'Name',
                      (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                  }, prefixIcon: Icons.person_2_outlined),
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

                  // Row(
                  //   children: [
                  //     Obx(
                  //       () => Checkbox(
                  //           value: _value.value,
                  //           onChanged: (val) {
                  //             _value.value = val!;
                  //           }),
                  //     ),
                  //     Text.rich(TextSpan(children: [
                  //       const TextSpan(
                  //           text: 'I accept all the',
                  //           style: TextStyle(color: AppColors.grayColor)),
                  //       TextSpan(
                  //           recognizer: TapGestureRecognizer()
                  //             ..onTap = () => Get.toNamed(terms),
                  //           text: ' Terms & Condition',
                  //           style: const TextStyle(
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.w600)),
                  //     ]))
                  //   ],
                  // ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select your gender',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  AnimatedRadioButtons(
                    backgroundColor: Color(0xFFFBFBFD).withOpacity(0.98),
                    value: _genderValue,
                    layoutAxis: Axis.horizontal,
                    buttonRadius: 18.0,
                    animationCurve: Curves.bounceIn,
                    items: [
                      AnimatedRadioButtonItem(
                          label: "Masculine", color: Colors.green),
                      AnimatedRadioButtonItem(
                          label: "Feminine", color: Colors.green),
                      AnimatedRadioButtonItem(
                          label: "Various", color: Colors.green)
                    ],
                    onChanged: (value) {
                      setState(() {
                        _genderValue = value;
                      });
                    },
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What age group are you in?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AnimatedRadioButtons(
                    backgroundColor: Color(0xFFFBFBFD).withOpacity(0.98),
                    value: _ageGroupValue,
                    layoutAxis: Axis.horizontal,
                    buttonRadius: 18.0,
                    animationCurve: Curves.bounceIn,
                    items: [
                      AnimatedRadioButtonItem(
                          label: "up to 20 years", color: Colors.green),
                      AnimatedRadioButtonItem(
                          label: "21 to 35 years", color: Colors.green),
                      AnimatedRadioButtonItem(
                          label: "36 to 55 years", color: Colors.green),
                      AnimatedRadioButtonItem(
                          label: "from 56 years", color: Colors.green),
                   
                    ],
                    onChanged: (value) {
                      setState(() {
                        _ageGroupValue = value;
                      });
                    },
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Sign Up',
                        () {
                          if (_formKey.currentState!.validate()) {
                            print('Success');
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
                        text: 'Already have an account?',
                        style: TextStyle(color: AppColors.grayColor)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(login),
                        text: ' Login',
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
