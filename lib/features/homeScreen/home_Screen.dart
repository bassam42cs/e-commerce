import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_figma/core/config/constants.dart';
import 'package:ui_figma/domain/models/MyProducts.dart';
import 'package:ui_figma/features/homeScreen/details_Screen.dart';
import 'package:ui_figma/features/homeScreen/widget/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int is_selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Our Products",
            style: Constants.theme.textTheme.titleLarge?.copyWith(color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(0, "All Products"),
              _buildProductCategory(1, "Jackets"),
              _buildProductCategory(2, "Sneakers"),
            ],
          ),
          Expanded(
            child: is_selected==0?_buildAllProduct():is_selected==1?_buildAllJackets():_buildAllSneakers(),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCategory(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          is_selected = index;
        });
      },
      child: Container(
        height: Constants.mediaQuery.height*0.10,
        width: 100,
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: is_selected == index ? Colors.red : Colors.redAccent,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          title,
          style: Constants.theme.textTheme.bodyMedium,
        ),
      ),
    );
  }

  Widget _buildAllProduct() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 100 / 130,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: MyProducts.allProducts.length,
      itemBuilder: (context, index) {
        final productItem = MyProducts.allProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsScreen(product: productItem);

            },));
          },
            child: ProductCard(product: productItem));
      },
    );
  }
  Widget _buildAllJackets() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 100 / 130,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: MyProducts.allJackets.length,
      itemBuilder: (context, index) {
        final jacketProduct = MyProducts.allJackets[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsScreen(product: jacketProduct);
            },));
          },
            child: ProductCard(product: jacketProduct));
      },
    );
  }
  Widget _buildAllSneakers() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 100 / 130,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: MyProducts.allSneakers.length,
      itemBuilder: (context, index) {
        final sneakerProduct = MyProducts.allSneakers[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailsScreen(product: sneakerProduct);
            },));
          },
            child: ProductCard(product: sneakerProduct));
      },
    );
  }
}
