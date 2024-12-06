import 'package:flutter/material.dart';
import 'package:ui_figma/core/config/constants.dart';
import 'package:ui_figma/features/ShoppingCart/cart_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("E - Commerce Shop"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CartScreen();
            },));

          }, icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: Constants.screen[Constants.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Constants.currentIndex,
        onTap: (value) {
          setState(() {
            Constants.currentIndex=value;
          });
        },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),

      ]
      ),

    );
  }
}
