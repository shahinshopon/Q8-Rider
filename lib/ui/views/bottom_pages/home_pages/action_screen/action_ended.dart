import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/action_screen/auction_win.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';


class ActionEndedScreen extends StatelessWidget {
  const ActionEndedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width ,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30.0,
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      ),
                      50.pw,
                      Text(
                        "Bidding",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                20.ph,
              ],
            ),
            20.ph,
            Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(AuctionWinScreen());
                  },
                  child: Image.asset(
                    "assets/images/Auction.png",
                  ),
                ),
                Positioned(
                  bottom: -20,
                    child: Image.asset("assets/images/Crossimg.png",height: 50.h,)),
              ],
            ),
            40.ph,
            Text('Auction has been ended',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal:10.w),
            //   child: horseAppButton("Next",(){}),
            // ),
          ],
        ),
      ),
    );
  }
}
