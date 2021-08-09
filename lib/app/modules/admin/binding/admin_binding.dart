import 'package:get/get.dart';
import 'package:homeecart/app/modules/admin/controller/admin_controller.dart';

class AdminBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AdminController>(() => AdminController());
  }

}