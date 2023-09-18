import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/action_screen/auction_history.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';

class AuctionWinScreen extends StatelessWidget {
  AuctionWinScreen({Key? key}) : super(key: key);

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
                  height: MediaQuery.of(context).size.height / 4,
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
                Positioned(
                  top: 10,
                  left: 0,
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
                        "Auction Owner",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                //40.ph,
               // 50.pw,
                  Positioned(
                      bottom: -40,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/men.png",),
                        radius: 35.r,
                        
                      ))
              ],
            ),
            50.ph,
            Text(
              'Congratulations',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            5.ph,
            Text('You won the auction',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),

            InkWell(
                onTap: (){
                    Get.to(AuctionHistoryScreen());
                  },
              child: Image.asset(
                "assets/images/win.png",
                height: 200,
              ),
            ),

            10.ph,
            ListTile(
              title: Text(
                'Carmer Beltran',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              subtitle: Text('20s ago',
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700)),
              leading: CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage('assets/images/horse.png'),
              ),
              trailing: Text('\$ 700',
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700)),
            ),
            10.ph,
            Text('Contact Auction Winner',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
             Padding(
               padding: const EdgeInsets.only(top: 10,left: 15,right: 15),
               child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 31,width: 35,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/whatsapp.png'))
                        ),
                       // child: Image.asset('assets/images/whatsapp.png',fit: BoxFit.fill,)
                        ),
                    ),
                    SizedBox(width: 20,),
                    Text('Whatsapp',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.w600),)
                  ],
                ),
               ),
             )
            //horseAppButton('Upload Product Image', () => Get.to(ProductImageScreen())),
            // Expanded(child: actionScreen(auctionHistoryitems,auctionHistoryitems.length)),
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
