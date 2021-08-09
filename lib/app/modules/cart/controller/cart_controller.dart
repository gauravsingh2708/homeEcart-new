import 'package:get/get.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/utils/utility.dart';

class CartController extends GetxController{
  UserService controller = Get.find();

  FirebaseRepository repo = FirebaseRepository();

  double price = 0.0;

  double deliveryCharge = 0.0;


  @override
  void onInit() {
    super.onInit();
  }


  void removeProduct(String uid) async {
    await repo.deleteProductFormCart(uid);
  }

  void incrementProduct(String uid){
    repo.updateCountValue(uid, 1);
  }

  void decrementProduct(String uid){
    repo.updateCountValue(uid, -1);
  }

  // void calculatePrice(){
  //   Utility.printDLog('Calculate cart price ');
  //   for(var i in controller.productListInCart){
  //     price = i.count * i.discountPrice;
  //   }
  //   update();
  // }


}