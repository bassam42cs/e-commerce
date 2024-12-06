import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ui_figma/features/ShoppingCart/manager/cubit.dart';
import 'package:ui_figma/features/ShoppingCart/manager/states.dart';
import '../../core/config/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartCubit = BlocProvider.of<CartCubit>(context);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CartCubit, CartStates>(
            bloc: cartCubit,
            builder: (context, state) {
              if (state is LoadingCartStates) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ErrorCartStates) {
                return const Center(child: Text('Error loading favorite items'));
              }
              if (state is SuccessCartStates) {
                final cartList = state.products;

                if (cartList.isEmpty) {
                  return const Center(child: Text('No favorite items'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      final product = cartList[index];
                      return  Slidable(
                        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            onPressed: (context) {
                              cartCubit.removeProduct(product);
                              setState(() {
                              });
                            },
                            flex: 1,
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ]),
                        child: ListTile(
                          title: Text(
                            product.name,
                            style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
                          ),
                          subtitle: Text(
                            "\$${product.price}",
                            style: Constants.theme.textTheme.bodySmall?.copyWith(color: Colors.grey),
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            child: Image.asset(product.image, fit: BoxFit.cover),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove, color: Colors.red),
                                onPressed: () {
                                  cartCubit.decrementQuantity(product);
                                  setState(() {

                                  });
                                },
                              ),
                              Text(
                                "${product.quantity}",
                                style: Constants.theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add, color: Colors.green),
                                onPressed: () {
                                  cartCubit.incrementQuantity(product);
                                  setState(() {
                                  });
                                },
                              ),
                            ],
                          ),
                          tileColor: Colors.white,
                        ),
                      );

                    },
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$${cartCubit.getTotalPrice()}",
              style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
            ),
            BlocBuilder<CartCubit,CartStates>(
                builder: (context, state) {
                  return ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red
                      ),
                      onPressed: () {
                        // cartCubit.addProduct(widget.product);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return const CartScreen();
                        //
                        // },));
                      },
                      icon: const Icon(Icons.send, color: Colors.white,),
                      label: Text("Check out",
                        style: Constants.theme.textTheme.bodyLarge,));
                }
            )
          ],
        ),
      ),
    );
  }
}
