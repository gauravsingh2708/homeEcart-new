import 'package:get/get.dart';
import 'package:homeecart/app/modules/admin/controller/edit_product_controller.dart';

class EditProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProductController>(() => EditProductController());
  }

}