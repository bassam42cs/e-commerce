import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_figma/core/config/app_theme_manager.dart';
import 'package:ui_figma/features/ShoppingCart/manager/cubit.dart';
import 'package:ui_figma/features/homeScreen/manager/cubit.dart';

import 'features/layout_Screen.dart';


GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(create: (context) => FavoriteCubit(),),
        BlocProvider<CartCubit>(create: (context) => CartCubit(),),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'e-commerce',
        theme: AppThemeManager.lightTheme,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home:const LayoutScreen()
    );
  }
}

