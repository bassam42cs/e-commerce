import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_figma/domain/models/productModel.dart';
import 'package:ui_figma/features/ShoppingCart/manager/states.dart';

class CartCubit extends Cubit<CartStates>{
  CartCubit() : super(LoadingCartStates());
  final List<ProductModel> _cartList = [];
  late double totalPrice;

  void addProduct(ProductModel product) {
    if(_cartList.contains(product)){
      for(ProductModel element in _cartList ){
        element.quantity++;
      }
    }
    else{
      _cartList.add(product);
      emit(SuccessCartStates(_cartList));
    }
  }

  void removeProduct(ProductModel product) {
    _cartList.remove(product);
    emit(SuccessCartStates(_cartList));
  }

  void incrementQuantity(ProductModel product){
    product.quantity++;
    emit(SuccessCartStates(_cartList));
  }
  void decrementQuantity(ProductModel product){
    if(product.quantity > 1){
      product.quantity--;
      emit(SuccessCartStates(_cartList));
    }
    else{
      removeProduct(product);
    }
    emit(SuccessCartStates(_cartList));
  }
   getTotalPrice(){
      totalPrice = 0.0;
     for(ProductModel element in _cartList){
      totalPrice += element.price * element.quantity;
    }
    return totalPrice;
  }
  List<ProductModel> get cartList => _cartList;
}