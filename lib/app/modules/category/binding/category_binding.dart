import 'package:get/get.dart';
import 'package:homeecart/app/modules/category/controller/category_controller.dart';

class CategoryBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CategoryController>(
          () => CategoryController(),
    );
  }

}