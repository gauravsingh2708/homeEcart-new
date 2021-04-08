import 'package:get/get.dart';
import 'package:homeecart/app/modules/add_products/controller/add_product_controller.dart';

class AddProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
          () => AddProductController(),
    );
  }
}