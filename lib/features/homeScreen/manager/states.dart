import 'package:ui_figma/domain/models/productModel.dart';

abstract class FavoriteStates{}
class LoadingFavoriteStates extends FavoriteStates{}
class SuccessFavoriteStates extends FavoriteStates{
  final List<ProductModel> product;
  SuccessFavoriteStates(this.product);
}
class ErrorFavoriteStates extends FavoriteStates{
   final String errorMessage;
  ErrorFavoriteStates(this.errorMessage);
}