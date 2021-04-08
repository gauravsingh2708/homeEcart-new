import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/firebase_collection.dart';
import 'package:homeecart/app/data/network_model/product.dart';

class AddProductController extends GetxController{
  Product product = Product();
  ///FormKey for addProductView
  final formKey = GlobalKey<FormState>();

  void onSubmit(){
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      FirebaseCollections.product.add(Product().toJson(product)).whenComplete(() =>Get.snackbar<void>('Product Added', 'Success'));
    }
  }
}