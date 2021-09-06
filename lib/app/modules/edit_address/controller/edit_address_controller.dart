import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/user.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/common_service.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/utils/utility.dart';

class EditAddressController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final CommonService _con = Get.find();

  UserModel user;

  @override
  void onInit() {
    createUserModel();
    super.onInit();
  }

  void createUserModel() async {
    user = UserModel()
      ..phone = Get.arguments['mobile'] as String
      ..uid = Get.arguments['uid'] as String
      ..lat = _con.locationData.latitude
      ..long = _con.locationData.longitude
      ..address = _con.locationData.addressLine1
      ..country = _con.locationData.area
      ..landmark = _con.locationData.placeName
      ..city = _con.locationData.city
      ..pinCode = _con.locationData.postalCode
      ..name = ' '
      ..email = ' '
      ..isMerchant = false;
  }

  Future<void> createUser() async {
    Utility.showLoadingDialog();
    if (formKey.currentState.validate()) {
      await FirebaseRepository().addUser(user).then((value) {
        Get.put(UserService(), permanent: true,);
        Utility.closeDialog();
        RoutesManagement.goToHome();
      });
    }
    Utility.closeDialog();
  }
}
