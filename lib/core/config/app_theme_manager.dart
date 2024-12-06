import 'package:flutter/material.dart';

class AppThemeManager{
  static const primaryColor = Colors.grey;
static ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  appBarTheme:  const AppBarTheme(
    backgroundColor: Colors.red,
    centerTitle: true,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: Colors.white
    )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedIconTheme: IconThemeData(
      color: Colors.red
    ),
    selectedItemColor: Colors.red,
    selectedLabelStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 18,
      color: Colors.grey
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.grey
    )
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontFamily: "Cairo",
      fontWeight: FontWeight.bold,
      fontSize:24,
      color: Colors.white
    ),
    bodyLarge: TextStyle(
      fontFamily: "Cairo",
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    bodyMedium: TextStyle(
      fontFamily: "Cairo",
      fontSize: 18,
      color: Colors.white
    ),
    bodySmall: TextStyle(
      fontFamily: "Cairo",
      fontSize: 16,
      color: Colors.white
    ),
  )
);
}