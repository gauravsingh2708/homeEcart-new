import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/common_service.dart';
import 'package:homeecart/app/modules/admin/controller/admin_controller.dart';
import 'package:homeecart/app/utils/utility.dart';

class EditDetailsController extends GetxController {
  Category category;

  final AdminController _controller = Get.find();


  /// Model to store product details
  Product product = Product();

  /// variable to image from gallery
  File file;
  File proFile;

  /// Instance to access firebase repository
  FirebaseRepository fr = FirebaseRepository();

  /// Instance to access common service controller
  CommonService commonService = Get.find();

  /// FormKey for addProductView
  final formKeyPro = GlobalKey<FormState>();

  /// FormKey for addProductView
  final formKeyCat = GlobalKey<FormState>();

  List<Category> allCategory = <Category>[];

  @override
  void onInit() {
    category = Get.parameters as Category;
    super.onInit();
  }

  /// Function to Select Image from gallery
  void selectCategoryImage() async {
    file = await commonService.getImageFromGallery();
    await fr.uploadImage(file, category.name).then((value) {
      category.imageUrl = value;
    });
    update();
  }

  /// On pressed Add category
  void updateCategory() async {
    Utility.showLoadingDialog();
    formKeyCat.currentState.save();
    await fr.updateCategory(category).whenComplete(Utility.closeDialog);
  }
}
