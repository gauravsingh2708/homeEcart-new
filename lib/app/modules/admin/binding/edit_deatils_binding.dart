import 'package:get/get.dart';
import 'package:homeecart/app/modules/admin/controller/edit_details_controller.dart';

class EditDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditDetailsController>(() => EditDetailsController());
  }
}