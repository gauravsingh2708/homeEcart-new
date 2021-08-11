import 'package:get/get.dart';
import 'package:homeecart/app/modules/cart/controller/cart_controller.dart';

class CartBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }

}