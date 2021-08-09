import 'package:get/get.dart';
import 'package:homeecart/app/modules/edit_profile/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(() => EditProfileController());
  }

}