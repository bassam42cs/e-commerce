import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_figma/domain/models/productModel.dart';
import 'package:ui_figma/features/ShoppingCart/cart_screen.dart';
import 'package:ui_figma/features/ShoppingCart/manager/cubit.dart';
import 'package:ui_figma/features/ShoppingCart/manager/states.dart';
import 'package:ui_figma/features/homeScreen/widget/avilable_size_widget.dart';


import '../../core/config/constants.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel product;
  const DetailsScreen({super.key,required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius:100,
                child:Image.asset(widget.product.image,fit: BoxFit.cover,)
              ),
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.product.name,style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),),
                Text("\$" "${widget.product.price.toString()}",style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),),
              ],
            ),
            Text(widget.product.description,style: Constants.theme.textTheme.bodyMedium?.copyWith(color: Colors.black),),
            Text("Available Size",style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),),
            const Row(
              children: [
                AvailableSizeWidget(size:"us 6"),
                AvailableSizeWidget(size:"us 7"),
                AvailableSizeWidget(size:"us 8"),
                AvailableSizeWidget(size:"us 9"),
              ],
            ),
            Text("Available Colors",style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),),
            Row(
              children: [
              _buildAvailableColors(Colors.blue),
              _buildAvailableColors(Colors.red),
              _buildAvailableColors(Colors.yellow),
            ],)
          ]

        ),
      ),
      bottomSheet: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomAppBar(
          color: Colors.red,
          child: SizedBox(
            height: Constants.mediaQuery.height / 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${widget.product.price}",
                  style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
                ),
                BlocBuilder<CartCubit,CartStates>(
                  builder: (context, state) {
                    return ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                        ),
                        onPressed: () {
                          cartCubit.addProduct(widget.product);
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const CartScreen();

                          },));
                        },
                        icon: const Icon(Icons.send, color: Colors.white,),
                        label: Text("Add to Cart",
                          style: Constants.theme.textTheme.bodyLarge,));
                  }
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
  _buildAvailableColors(Color colorCircle){
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        radius: 15,
        backgroundColor: colorCircle,
      ),
    );
  }
}
