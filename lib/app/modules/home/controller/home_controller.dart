import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/firebase_collection.dart';
import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/data/network_model/post.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/network_model/slider.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/utils/utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:homeecart/app/modules/home/view/home_view.dart';

class HomeController extends GetxController {
  /// Instance of UserService controller
  final UserService controller = Get.find();

  /// A pull down controllers to handle the refresh
  final RefreshController homeRefreshController = RefreshController(initialRefresh: false);

  ///Flag to show toolTips
  bool showToolTips = true;

  ///ScrollController for HomePage
  ScrollController scrollController;

  /// Current index in [HomeView]
  int currentTab = 0;

  ///List to store category object
  List<Category> categoryItem = <Category>[];

  ///List to store slider data
  List<SliderModel> sliderItem = <SliderModel>[];

  List<Product> productListPost = [];

  ProductPost productPost = ProductPost();

  BannerModel bannerModel = BannerModel();

  @override
  void onInit() {
    Get.put( UserService(), permanent: true,);
    scrollController = ScrollController()..addListener(_scrollListener);
    getCategory();
    getSlider();
    getBanner();
    getPost();
    super.onInit();
  }

  /// A method which will listen to any scroll changes
  void _scrollListener() {
    innerTitlePadding = min(scrollController.offset < 0 ? 0 : scrollController.offset, 52);
    innerTitleOpacity = (innerTitlePadding == 52)
        ? 0
        : scrollController.offset * 0.01 > 1
        ? 0
        : 1 - scrollController.offset * 0.01;
    if (innerTitleOpacity < 0) innerTitleOpacity = 0;
    if (innerTitleOpacity > 1) innerTitleOpacity = 1;
    update();
  }

  /// Set the opacity value for the inner title
  double innerTitleOpacity = 1.0;

  /// Set the left padding value for the inner title
  double innerTitlePadding = 0.0;

  ///Fetch category data from firebase
  Future<void> getCategory() async {
    categoryItem = [];
    update();
    await FirebaseCollections.category
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var i in querySnapshot.docs) {
        categoryItem.add(Category.fromJson(i.data()));
      }
      Utility.printDLog('length of category list is ${categoryItem.length}');
    }).whenComplete(update);
  }

  Future<void> getSlider() async {
    sliderItem = [];
    update();
    await FirebaseCollections.slider.get().then((QuerySnapshot querySnapshot) {
      for (var i in querySnapshot.docs) {
        sliderItem.add(SliderModel.fromJson(i.data()));
      }
    }).whenComplete(update);
  }

  Future<void> getBanner() async {
    bannerModel = BannerModel();
    update();
    await FirebaseCollections.banner.get().then((QuerySnapshot querySnapshot) {
      bannerModel = BannerModel.fromJson(querySnapshot.docs[0].data());
    }).whenComplete(update);
  }

  Future<void> getPost() async {
    productListPost = [];
    update();
    await FirebaseCollections.post.get().then((QuerySnapshot querySnapshot) {
      for (var i in querySnapshot.docs) {
        print(i.data());
        productPost = ProductPost.fromJson(i.data());
      }
      for (var i = 0; i < productPost.productList.length; i++) {
        FirebaseCollections.product
            .where('Id', isEqualTo: 1)
            .get()
            .then((QuerySnapshot querySnapshot) => productListPost
                .add(Product.fromJson(querySnapshot.docs[0].data())))
            .whenComplete(update);
      }
    }).whenComplete(update);
    print(productListPost.length);
  }



  ///Function call when refresh home page
  void refreshHomePage() async {
    await getCategory();
    await getSlider();
    await getBanner();
    await getPost();
    homeRefreshController.refreshCompleted();
  }

  ///Function to tooltips
  void hideToolTips() {
    showToolTips = false;
    update();
  }
  //
  // void _scrollListener() {
  //   update();
  // }

  final List<BottomNavigationBarItem> tab = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.electrical_services_rounded), label: 'Services'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.account_balance_wallet_outlined), label: 'Rewards'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  void changeTab(int index) {
    currentTab = index;
    update();
  }
}
