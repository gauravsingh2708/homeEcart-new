import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/user.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/utils/utility.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final UserService _con = Get.find();

  UserModel user;

  @override
  void onInit() {
    createUserModel();
    super.onInit();
  }

  void createUserModel() async {
    user = UserModel()
      ..phone = _con.userModel.phone
      ..uid = _con.userModel.uid
      ..lat = _con.userModel.lat
      ..long = _con.userModel.long
      ..address = _con.userModel.address
      ..country = _con.userModel.country
      ..landmark = _con.userModel.landmark
      ..city = _con.userModel.city
      ..pinCode = _con.userModel.pinCode
      ..name = _con.userModel.name
      ..email = _con.userModel.email
      ..isMerchant = _con.userModel.isMerchant;
  }

  Future<void> updateUser() async {
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
