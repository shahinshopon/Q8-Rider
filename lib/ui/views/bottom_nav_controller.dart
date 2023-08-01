import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_colors.dart';
import 'package:practice/ui/views/nav_pages/favourite.dart';
import 'package:practice/ui/views/nav_pages/home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

// ignore: must_be_immutable
class BottomNavController extends StatelessWidget {
  int selectedIndex;
  BottomNavController({super.key,required this.selectedIndex});

  late RxInt _currentIndex = selectedIndex.obs;
  final _pages = [
    Home(),
    Favourite(),
    // Cart(),
    // SleepRating(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: SalomonBottomBar(
            selectedItemColor: AppColors.mandarinColor,
            currentIndex: _currentIndex.value,
            onTap: (val) {
              _currentIndex.value = val;
            },
            items: [
              bottomBarItem(Icons.games, 'Brain Game'),
              bottomBarItem(Icons.night_shelter, 'Sleep Coach'),
              // bottomBarItem(Icons.shopping_bag_outlined, 'Cart'),
              // bottomBarItem(Icons.person_outline, 'Person'),
            ],
          ),
          body: _pages[_currentIndex.value],
        ));
  }
}

SalomonBottomBarItem bottomBarItem(icon, title) =>
    SalomonBottomBarItem(icon: Icon(icon), title: Text(title));
