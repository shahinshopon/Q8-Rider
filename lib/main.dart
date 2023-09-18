// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:practice/theme/theme.dart';
import 'ui/route/route.dart';
import 'ui/views/auth_pages/sign_up.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    var theme = box.read('theme');
    return ScreenUtilInit(
      designSize: const Size(360, 790),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme().lightTheme(context),
          darkTheme: AppTheme().darkTheme(context),
          themeMode: theme == null
              ? ThemeMode.light
              : theme == 'dark'
              ? ThemeMode.dark
              : ThemeMode.light,
          home: SignUp(),
          initialRoute: signUp,
          getPages: getPages,
        );
      },
    );
  }
}
