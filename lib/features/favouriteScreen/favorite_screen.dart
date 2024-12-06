import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ui_figma/features/homeScreen/manager/cubit.dart';
import 'package:ui_figma/features/homeScreen/manager/states.dart';
import '../../../core/config/constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteCubit = BlocProvider.of<FavoriteCubit>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Favorites',
              style: Constants.theme.textTheme.titleLarge?.copyWith(color: Colors.black),
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<FavoriteCubit, FavoriteStates>(
            bloc: favoriteCubit,
            builder: (context, state) {
              if (state is LoadingFavoriteStates) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ErrorFavoriteStates) {
                return const Center(child: Text('Error loading favorite items'));
              }
              if (state is SuccessFavoriteStates) {
                final favoriteProducts = state.product;

                if (favoriteProducts.isEmpty) {
                  return const Center(child: Text('No favorite items'));
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: favoriteProducts.length,
                    itemBuilder: (context, index) {
                      final product = favoriteProducts[index];
                      return Slidable(
                        endActionPane: ActionPane(motion: const ScrollMotion(), children: [
                          SlidableAction(
                            onPressed:(context) {
                              favoriteCubit.removeFavorite(product);
                            },
                            flex: 1,
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ]),
                        child: ListTile(
                          title: Text(product.name,style: Constants.theme.textTheme.bodyLarge?.copyWith(color: Colors.black),),
                          subtitle: Text(product.description,style: Constants.theme.textTheme.bodySmall?.copyWith(color: Colors.grey),),
                          leading: CircleAvatar(
                            radius: 30,
                            child: Image.asset(product.image,fit: BoxFit.cover,),
                          ),
                          trailing: Text("\$${product.price}",style: Constants.theme.textTheme.bodyMedium?.copyWith(color: Colors.black),),
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
    );
  }
}
