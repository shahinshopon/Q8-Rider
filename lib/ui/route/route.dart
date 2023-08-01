import 'package:get/get.dart';
import 'package:practice/ui/views/auth/forget_password.dart';
import 'package:practice/ui/views/auth/login.dart';
import 'package:practice/ui/views/auth/registration.dart';
import 'package:practice/ui/views/bottom_nav_controller.dart';
import 'package:practice/ui/views/nav_pages/home.dart';
import 'package:practice/ui/views/not_found.dart';
import 'package:practice/ui/views/splash.dart';
import 'package:practice/ui/views/terms_condition.dart';

const String splash = '/splash-screen';
const String unknown = '/not-found';
const String login = '/login';
const String registration = '/registration';
const String forgetPass = '/forgetPass';
const String terms = '/terms';
const String bottomNav = '/bottomNav';
const String number = '/number';
const String next = '/next';
const String letter = '/letter';
const String firstStepresult = '/numberLetterresult';
const String rulesOfBarinGame = '/rulesOfBarinGame';
const String characterLetter = '/character-letter';
const String characterNumber = '/character-number';
const String summary = '/summary';
const String showTotalresult = '/show-total-result';

List<GetPage> getPages = [
  GetPage(
    name: unknown,
    page: () => const Unknown(),
  ),
  GetPage(
    name: splash,
    page: () => const Splash(),
  ),
  GetPage(
    name: login,
    page: () => Login(),
  ),
  GetPage(
    name: registration,
    page: () => Registration(),
  ),
  GetPage(
    name: forgetPass,
    page: () => ForgetPassword(),
  ),
  GetPage(
    name: terms,
    page: () => const TermCondition(),
  ),
  GetPage(
    name: bottomNav,
    page: () {
      BottomNavController bottomNavController = Get.arguments;
      return bottomNavController;
    },
  ),
  GetPage(
    name: number,
    page: () => NumberTestScreen(),
  ),
  GetPage(
    name: next,
    page: () => ContinueWithLettersScreen(),
  ),
  GetPage(
    name: letter,
    page: () => LetterTestScreen(),
  ),
  GetPage(
    name: firstStepresult,
    page: () => FirstSecondStepResult(),
  ),
  GetPage(
    name: rulesOfBarinGame,
    page: () => RulesOfMemoryGame(),
  ),
  GetPage(
    name: characterLetter,
    page: () => BrainTestLetter(),
  ),
  GetPage(
    name: characterNumber,
    page: () => BrainTestNumber(),
  ),
  GetPage(
    name: summary,
    page: () => SummaryScreen(),
  ),
  GetPage(
    name: showTotalresult,
    page: () => ShowTotalResult(),
  ),
];
