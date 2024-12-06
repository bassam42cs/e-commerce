import 'package:flutter/material.dart';
import 'package:ui_figma/main.dart';

import '../../features/favouriteScreen/favorite_screen.dart';
import '../../features/homeScreen/home_Screen.dart';
import '../../features/profileScreen/profile_Screen.dart';

class Constants{
  static var mediaQuery =MediaQuery.of(navigatorKey.currentState!.context).size;
  static var theme = Theme.of(navigatorKey.currentState!.context);
  static int currentIndex=0;
  static List screen = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

}