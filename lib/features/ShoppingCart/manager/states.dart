import 'package:ui_figma/domain/models/productModel.dart';

class CartStates{}
class LoadingCartStates extends CartStates{}
class SuccessCartStates extends CartStates{
  List<ProductModel> products ;
  SuccessCartStates(this.products);
}
class ErrorCartStates extends CartStates{
  String error;
  ErrorCartStates(this.error);
}