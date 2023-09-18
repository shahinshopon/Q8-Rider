import 'package:get/get.dart';
import 'package:practice/ui/views/auth_pages/sign_in.dart';
import 'package:practice/ui/views/auth_pages/sign_up.dart';
import 'package:practice/ui/views/bottom_nav.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/action_screen/action_ended.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/best_seller.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/female_rider_page.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/home_details.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/storage_screen/storage.dart';
import 'package:practice/ui/views/bottom_pages/home_pages/view_storage.dart';
import 'package:practice/ui/views/bottom_pages/post_screen.dart';


const String signUp = '/signUp-screen';
const String signIn = '/signIn-screen';
const String bottomNav = '/bottomNav-screen';
const String horseSell = '/horseSell-screen';
const String stores = '/stores-screen';
const String bestSeller = '/bestSeller-screen';
const String postScreen = '/postScreen-screen';
const String femaleRiderScreen = '/femaleRider-screen';
const String storageScreen = '/storage-screen';
const String actionEndedScreen = '/actionEndedScreen-screen';

List<GetPage> getPages = [
  GetPage(
    name: signUp,
    page: () => SignUp(),
  ),
  GetPage(
    name: signIn,
    page: () => SignIn(),
  ),
  GetPage(
    name: bottomNav,
    page: () => BottomNavController(),
  ),
  GetPage(
    name: horseSell,
    page: () => HomeDetailsScreen(),
  ),
  GetPage(
    name: stores,
    page: () => ViewStoresScreen(),
  ),
  GetPage(
    name: bestSeller,
    page: () => BestSellerScreen(data: Get.arguments),
  ),
  GetPage(
    name: postScreen,
    page: () => PostScreen(),
  ),
  GetPage(
    name: femaleRiderScreen,
    page: () => FemaleRiderScreen(data: Get.arguments),
  ),
  GetPage(
    name: storageScreen,
    page: () => StorageScreen(),
  ),
  GetPage(
    name: actionEndedScreen,
    page: () => ActionEndedScreen(),
  ),
];
