import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/ui/responsive/size_config.dart';
import 'package:practice/ui/views/bottom_nav_controller.dart';
// import 'package:practice/ui/route/route.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    //Timer(const Duration(seconds: 3), ()=>Get.offNamed(login));
    Timer(const Duration(seconds: 3), ()=>Get.to(()=>BottomNavController(selectedIndex: 0,)));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icons/logo.png',width: 100.w,),
      ),
    );
  }
}
