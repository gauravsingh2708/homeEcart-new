import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/firebase_collection.dart';
import 'package:homeecart/app/data/network_model/product.dart';

class CategoryController extends GetxController{
  String title = '';
  int id;

  void initialSetup(Map<String, dynamic> arguments){
    title = arguments['title'] as String;
    id = arguments['id'] as int;
    print(arguments);
  }

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  List<Product> productList;
  Future<void> getProduct() async {
    productList = [];
    await FirebaseCollections.product.where('CategoryId',isEqualTo: Get.arguments['id'],).get().then((QuerySnapshot querySnapshot) {
      for(var i in querySnapshot.docs){
        productList.add(Product.fromJson(i.data()));
      }
    }).whenComplete(update);
  }
}