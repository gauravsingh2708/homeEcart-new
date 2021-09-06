import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/cart_product_model.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/network_model/user.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/utils/utility.dart';

class UserService extends GetxController {
  StreamSubscription cartStreamSubscription;

  /// Instance to store user details
  UserModel userModel = UserModel();

  int cartCount;

  double price = 0.0;

  double deliveryCharge = 0.0;

  int count = 0;
  bool isLoading = true;

  bool userCreated = false;

  /// Instance to get all firebase repository
  FirebaseRepository repo = FirebaseRepository();

  List<CartProduct> productListInCart = <CartProduct>[];

  @override
  void onInit() async {
    Utility.printDLog('User service controller');
    _addPostFrameCallback();
    cartCount = 0;
    await getUserDetails();
    await countCartProduct();

    super.onInit();
  }

  @override
  void onClose() {
    cartStreamSubscription.cancel();
    super.onClose();
  }

  Future<bool> checkUserCreated() async {
    await repo.checkProfileCreate(userModel.uid).then((value) {
      if (value) {
        return true;
      }
    });
    return false;
  }

  void _addPostFrameCallback() {
    Utility.printDLog('Stream Listen to Cart');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      cartStreamSubscription = repo.cart().listen((QuerySnapshot ds) {
        price = 0.0;
        cartCount = 0;
        // ignore: avoid_function_literals_in_foreach_calls
        ds.docs.forEach((element) {
          var model = CartProduct.fromJson(element.data());
          productListInCart.add(model);
          price += model.discountPrice * model.count;
          cartCount += 1;
          Utility.printDLog('${element.data()}');
        });
        update();
      });
    });
  }

  Future<void> countCartProduct() async {
    Utility.showLoadingDialog();
    await repo.countCartProduct().then((value) {
      productListInCart = value;
      Utility.closeDialog();
    });
    cartCount = productListInCart.length;
    calculatePrice();
    Utility.printDLog('Count of cart product is $cartCount');
    update();
  }

  void calculatePrice() {
    Utility.printDLog('Calculate cart price ');
    price = 0.0;
    for (var i in productListInCart) {
      price += i.count * i.discountPrice;
    }
    update();
  }

  void addProductToCart(Product model) async {
    if (!checkProductInCart(model.id)) {
      Utility.showLoadingDialog();
      await repo.addProductToCart(model).whenComplete(() async {
        // await countCartProduct();
        Utility.closeDialog();
      });
    }
  }

  bool checkProductInCart(String id) {
    for (var i in productListInCart) {
      if (i.id == id) {
        Utility.printDLog(' product present in cart}');
        return true;
      }
    }
    Utility.printDLog(' product not present in cart}');
    return false;
  }

  int indexOfProduct(String id) {
    for (var i = 0; i < productListInCart.length; i++) {
      if (productListInCart[i].id == id) {
        Utility.printDLog(' product present in cart}');
        return i;
      }
    }
    return 0;
  }

  void removeProduct(String uid) async {
    await repo.deleteProductFormCart(uid);
    await countCartProduct();
    update();
  }

  void incrementProduct(String uid) async {
    await repo.updateCountValue(uid, 1);
    await countCartProduct();
    update();
  }

  void decrementProduct(String uid) async {
    await repo.updateCountValue(uid, -1);
    await countCartProduct();
    update();
  }

  Future<void> getUserDetails() async {
    userModel = await repo.getUserData();
  }
}
