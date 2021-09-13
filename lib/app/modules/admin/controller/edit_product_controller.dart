import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/firebase_collection.dart';
import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/common_service.dart';
import 'package:homeecart/app/modules/admin/controller/admin_controller.dart';
import 'package:homeecart/app/theme/styles.dart';
import 'package:homeecart/app/utils/utility.dart';

class EditProductController extends GetxController{

  Product product = Get.arguments as Product;


  final AdminController _controller = Get.find();

  /// Model to store category details
  Category category = Category();

  /// variable to image from gallery
  File file;
  File proFile;

  /// Instance to access firebase repository
  FirebaseRepository fr = FirebaseRepository();

  /// Instance to access common service controller
  CommonService commonService = Get.find();

  /// FormKey for addProductView
  final formKeyPro = GlobalKey<FormState>();


  List<Category> allCategory = <Category>[];

  @override
  void onInit() async {
    allCategory = await fr.getAllCategory();
    super.onInit();
  }

  /// Function to Select Image from gallery
  void selectImage() async {
    file = await commonService.getImageFromGallery();
    update();
  }

  /// Function to Select Image from gallery
  void selectImageForProduct() async {
    proFile = await commonService.getImageFromGallery();
    update();
  }


  void updateProduct() async {
    if (formKeyPro.currentState.validate()) {
      formKeyPro.currentState.save();
      Utility.showLoadingDialog();
      Utility.printDLog('${product.toJson(product)}');
      if(proFile != null){
        await fr.uploadImage(proFile, product.name).then((value) {
          product.imageUrl = value;
          fr.productCollection.doc(product.id)
              .update(product.toJson(product))
              .whenComplete((){
            Utility.closeDialog();
            Get.snackbar<void>('Product Updated', 'Success');});
        });
      }
      else{
        await fr.productCollection.doc(product.id)
            .update(product.toJson(product))
            .whenComplete((){
          Utility.closeDialog();
          Get.snackbar<void>('Product Updated', 'Success');});
      }

    }
  }

  void showBottomSheet() {
    print(allCategory.length);
    Get.bottomSheet<dynamic>(Container(
      height: 500,
      color: Colors.white,
      child: ListView(
        children: List.generate(
            allCategory.length,
                (index) => InkWell(
                onTap: () {
                  category = allCategory[index];
                  print(category.id);
                  update();
                  Get.back<dynamic>();
                },
                child: ListTile(
                  title: Text(
                    allCategory[index].name,
                    style: Styles.black18,
                  ),
                  leading: CircleAvatar(
                    child:
                    Image(image: NetworkImage(allCategory[index].imageUrl)),
                  ),
                ))),
      ),
    ));
  }
}