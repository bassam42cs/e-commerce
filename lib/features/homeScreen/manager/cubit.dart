import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_figma/features/homeScreen/manager/states.dart';
import '../../../domain/models/productModel.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(SuccessFavoriteStates([])); // Emit an empty Success state initially
  final List<ProductModel> _favoriteList = [];

  void addFavorite(ProductModel product) {
    if (!_favoriteList.contains(product)) {
      _favoriteList.add(product);
      emit(SuccessFavoriteStates(_favoriteList));
    }
  }

  void removeFavorite(ProductModel product) {
    if (_favoriteList.contains(product)) {
      _favoriteList.remove(product);
      emit(SuccessFavoriteStates(_favoriteList));
    }
  }

  List<ProductModel> get favoriteList => _favoriteList;
}
