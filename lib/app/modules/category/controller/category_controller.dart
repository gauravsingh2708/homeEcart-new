import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/firebase_collection.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/utils/utility.dart';

class CategoryController extends GetxController{
  String title = '';
  String id;

  void initialSetup(Map<String, dynamic> arguments){
    title = arguments['title'] as String;
    id = arguments['id'] as String;
    print(arguments);
  }

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  List<Product> productList = <Product>[];
  Future<void> getProduct() async {
    productList = [];
    await FirebaseCollections.product.where('CategoryId',isEqualTo: Get.arguments['id'],).get().then((QuerySnapshot querySnapshot) {
      for(var i in querySnapshot.docs){
        Utility.printILog('${i.data()}');
        productList.add(Product.fromJson(i.data()));
      }
    }).whenComplete(update);
  }
}