import 'package:get/get.dart';
import 'package:homeecart/app/modules/edit_address/controller/edit_address_controller.dart';

class EditAddressBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditAddressController>(() => EditAddressController());
  }

}