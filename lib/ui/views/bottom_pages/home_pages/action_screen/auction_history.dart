
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:practice/const/app_strings.dart';
import 'package:practice/ui/route/route.dart';
import 'package:practice/ui/styles/styles.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/action_screen/product_image.dart';
import 'package:practice/ui/views/bottom_pages/market_page.dart';
import 'package:practice/ui/widgets/custome_button.dart';
import 'package:practice/ui/widgets/custome_sizebox.dart';

class AuctionHistoryScreen extends StatelessWidget {
   AuctionHistoryScreen({Key? key}) : super(key: key);
final List<Map<String, String>> auctionHistoryitems = [
    {
      'title': 'Carmer Beltran',
      'subtitle': '\$ 700 - 20s ago',
      'image': 'assets/images/men.png',
      //'price': '\$ 700',
    },
    {
      'title': 'Carmer Beltran',
      'subtitle': '\$ 700 - 20s ago',
      'image': 'assets/images/horse.png',
      //'price': '\$ 700'
    },
    {
      'title': 'Carmer Beltran',
      'subtitle': '\$ 700 - 20s ago',
      'image': 'assets/images/men.png',
      //'price': '\$ 700',
    },
    {
      'title': 'Carmer Beltran',
      'subtitle': '\$ 700 - 20s ago',
      'image': 'assets/images/men.png',
     //'price': '\$ 700'
    },
    {
      'title': 'Carmer Beltran',
      'subtitle':'\$ 700 - 20s ago',
      'image': 'assets/images/men.png',
     // 'price': '\$ 700',
    },
    {
      'title': 'Carmer Beltran',
      'subtitle': '20s ago',
      'image': 'assets/images/men.png',
      //'price': '\$ 700'
    },
  
  ];

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
                        "Auction history",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                 Positioned(
                      bottom: -40,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/men.png",),
                        radius: 35.r,
                        
                      )),
               // 20.ph,
              ],
            ),
            40.ph,
            Text('Auction History',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600)),
                Image.asset(
                  "assets/images/Auction.png",
                  height: 100,
                ),
             
            20.ph,
           // horseAppButton('Upload Product Image', () => Get.to(ProductImageScreen())),
            Expanded(
              child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    itemCount: auctionHistoryitems.length,
    itemBuilder: (_, index) {
      return ListTile(
        title: Text(
          auctionHistoryitems[index]['title']!,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
        ),
        subtitle: Text(auctionHistoryitems[index]['subtitle']!,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700)),
        leading: CircleAvatar(
          radius: 30.r,
          backgroundImage: AssetImage(auctionHistoryitems[index]['image']!),
        ),
        trailing: Container(
                height: 30,
                width: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 20,width: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/whatsapp.png'))
                        ),
                       // child: Image.asset('assets/images/whatsapp.png',fit: BoxFit.fill,)
                        ),
                    ),
                    SizedBox(width: 5,),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text('Whatsapp',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.w600),),
                    )
                  ],
                ),
               ),
      );
    },
  )
              ),
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
