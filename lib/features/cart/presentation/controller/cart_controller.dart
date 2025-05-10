import 'package:get/get.dart';

import '../../../../core/constants.dart';

class CartController extends GetxController {

  var cartItems = <Map<String, dynamic>>[].obs;
  var quantity = 1.obs;

  void addToCart(Map<String, dynamic> product) {
    cartItems.add(product);
  }

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    quantity--;
  }

  int get totalPrice => cartItems.fold(0, (sum, item) => sum + (item[Constants.price]as int));

}