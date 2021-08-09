import 'package:get/get.dart';
import 'package:homeecart/app/modules/checkout/controller/checkout_controller.dart';

class CheckoutBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CheckoutController>(() => CheckoutController());
  }

}