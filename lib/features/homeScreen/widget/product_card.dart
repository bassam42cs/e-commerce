import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_figma/domain/models/productModel.dart';
import 'package:ui_figma/features/homeScreen/manager/cubit.dart';
import '../../../core/config/constants.dart';
import '../manager/states.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;
  ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

    return Container(
      width: Constants.mediaQuery.width / 2,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          BlocBuilder<FavoriteCubit, FavoriteStates>(
            builder: (context, state) {
              isSelected = favoriteCubit.favoriteList.contains(widget.product);// to sava current favList if i navigate to another screen and pop to first screen
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                    if (isSelected) {
                      favoriteCubit.addFavorite(widget.product);
                    } else {
                      favoriteCubit.removeFavorite(widget.product);
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isSelected
                        ? const Icon(Icons.favorite_rounded, color: Colors.red)
                        : const Icon(Icons.favorite_border),
                  ],
                ),
              );
            },
          ),
          const SizedBox(width: 8),
          SizedBox(
            height: 130,
            width: 130,
            child: Image.asset(widget.product.image, fit: BoxFit.cover),
          ),
          const SizedBox(width: 8),
          Text(
            widget.product.name,
            style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),
          ),
          const SizedBox(width: 8),
          Text(
            widget.product.price.toStringAsFixed(2),
            style: Constants.theme.textTheme.bodyMedium?.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

