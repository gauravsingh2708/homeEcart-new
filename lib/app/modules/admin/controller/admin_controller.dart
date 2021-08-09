import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/market.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/utils/utility.dart';

class AdminController extends GetxController{
  // final UserService _controller = Get.find();
  FirebaseRepository firebaseRepository = FirebaseRepository();
  MarketModel marketModel = MarketModel();

  @override
  void onInit() async {
    await getMarketDetails();
    super.onInit();
  }

  Future<void> getMarketDetails() async{
    await firebaseRepository.getMarketDetails().then((value){
      marketModel = value;
      Utility.printDLog('${value.name}');
      update();
    });
  }

  Future<void> deleteCategory(String uid) async {
    await firebaseRepository.deleteCategory(uid);
  }
}