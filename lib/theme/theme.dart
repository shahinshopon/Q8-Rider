// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 18),
    ),
    colorScheme: ColorScheme.light(),
    // primarySwatch: Colors.blue,
    textTheme: GoogleFonts.darkerGrotesqueTextTheme(
      Theme.of(context).textTheme.apply(
        bodyColor: Colors.black,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );

  ThemeData darkTheme(context) => ThemeData(
    tabBarTheme: TabBarTheme(
      labelStyle: TextStyle(fontSize: 18),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(),
    //  primarySwatch: Colors.amber,
    textTheme: GoogleFonts.darkerGrotesqueTextTheme(
      Theme.of(context).textTheme.apply(
        bodyColor: Colors.white,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}