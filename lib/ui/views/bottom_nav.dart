import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice/const/app_colors.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/views/bottom_pages/bottom_home_page.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/action_screen/product_image.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/view_storage.dart';
import 'package:practice/ui/views/bottom_pages/setting_page.dart';
import 'package:practice/ui/views/bottom_pages/shopping_page.dart';


class BottomNavController extends StatefulWidget {
  BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  RxInt _initialIndex = 0.obs;

  final _pages = [
    BottomHomePage(),
    //BottomMarketPage(),
    BottomShoopingPage(),
    ViewStoresScreen(),
    BottomSettingPage()
  ];

  final box = GetStorage();
  var check;
  @override
  void initState() {
    var readValue= box.read('owner');
    check=readValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    // var brightness = Theme.of(context).brightness;
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom:45.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.horseButtonColor,
          onPressed: (){
           if(check==true){
            Get.to(ProductImageScreen());
           }else{
            Get.toNamed(postScreen);
           }
          },
          //Get.toNamed(postScreen),
          child:  Icon(
            Icons.add,
            size: 30.w,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => AnimatedNotchBottomBar(
            // color:
            // brightness == Brightness.dark ? AppColors.dark : Colors.white,

            pageController: PageController(
              initialPage: _initialIndex.value,
            ),
            bottomBarItems: [
              navItem("assets/icons/home.png"),
              navItem("assets/icons/auction.png"),
              navItem("assets/icons/store.png"),
              navItem("assets/icons/setting.png"),
            ],
            onTap: (int value) {
              _initialIndex.value = value;
            },
          )),
      body: SafeArea(
        child: Obx(
          () => _pages[_initialIndex.value],
        ),
      ),
    );
  }
}

BottomBarItem navItem(inActiveIcon) {
  return BottomBarItem(
    inActiveItem: Image.asset(
      inActiveIcon,
      color: Colors.black,
      height: 50,
      width: 50,
      fit: BoxFit.cover,
    ),
    activeItem: Image.asset(
      inActiveIcon,
      color: AppColors.horseButtonColor,
      height: 50,
      width: 50,
      fit: BoxFit.cover,
    ),
  );
}
