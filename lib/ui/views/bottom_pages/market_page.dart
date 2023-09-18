// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/action_screen/auction_history.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';
import 'package:practice/ui/widgets/custome_text_field.dart';

class BottomMarketPage extends StatelessWidget {
  BottomMarketPage({Key? key}) : super(key: key);
  TextEditingController priceBidController = TextEditingController();
  final List<Map<String, String>> actionScreenitems = [
    {
      'title': 'Carmer Beltran',
      'subtitle': '20s ago',
      'image': 'assets/images/horse.png',
      'price': '\$ 700',
    },
    {
      'title': 'Carmer Beltran',
      'subtitle': '20s ago',
      'image': 'assets/images/horse.png',
      'price': '\$ 700'
    },
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.r,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.r),
                          bottomRight: Radius.circular(40.r),
                        ),
                        child: Image.asset(
                          "assets/images/animal.jpg",
                          fit: BoxFit.fill,
                        )),
                  ),
                  Positioned(top: 10,left: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          iconSize: 30.0,
                          color: Colors.white,
                          onPressed: () => Navigator.pop(context),
                        ),
                        20.pw,
                        Text(
                          "Bidding",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        50.pw,
                        
                      ],
                    ),
                  ),
                  // Positioned(top: 10,right: 10,
                  //   child: IconButton(
                  //         icon: Icon(Icons.history),
                  //         iconSize: 30.0,
                  //         color: Colors.white,
                  //         onPressed: () => Get.to(AuctionHistoryScreen()),
                  //       ),),
                  50.pw,
                  Positioned(
                      bottom: -50,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/men.png"),
                        radius: 50.r,
                      ))
                ],
              ),
              50.ph,
              Center(
                child: Text(
                  "Horse Image",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
              ),
              20.ph,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 6.r,
                  ),
                  const SizedBox(width: 3,),
                  Text(
                    "White",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700),
                  ),
                  15.pw,
                  CircleAvatar(
                    radius: 6.r,
                    backgroundColor: Colors.red,
                  ),
                  const SizedBox(width: 3,),
                  Text(
                    "Eclipse",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700),
                  ),
                  15.pw,
                  CircleAvatar(radius: 6.r, backgroundColor: Colors.green),
                  const SizedBox(width: 3,),
                  Text(
                    "Male",
                    style:
                        TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              20.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Estimate",
                      style:
                          TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Current bid",
                      style:
                          TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              10.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ 800 - 1200",
                      style:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "\$ 700",
                      style:
                          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              10.ph,
              Divider(),
              
              ListTile(
                leading: Icon(
                  Icons.balance_outlined,
                  size: 20.w,
                ),
                title: Text(
                  "Warning 1 at \$ 700",
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 130.h, child: actionScreen(actionScreenitems,actionScreenitems.length)),
              10.ph,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:15.w),
                child: customTextField("Place your Bid",priceBidController,"+20 eg"),
              ),
              10.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: horseAppButton(
                    "Place your bid", () => Get.toNamed(actionEndedScreen)),
              ),
              10.ph,
            ],
          ),
        ),
      ),
    );
  }
}

ListView actionScreen(horseSale,length) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: length,
    itemBuilder: (_, index) {
      return ListTile(
        title: Text(
          horseSale[index]['title'],
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(horseSale[index]['subtitle'],
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700)),
        leading: CircleAvatar(
          radius: 30.r,
          backgroundImage: AssetImage(horseSale[index]['image']),
        ),
        trailing: Text(horseSale[index]['price'],
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
      );
    },
  );
}
