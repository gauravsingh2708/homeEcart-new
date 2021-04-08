import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/firebase_collection.dart';
import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/data/network_model/slider.dart';
import 'package:homeecart/app/utils/string_constant.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:homeecart/app/modules/home/view/home_view.dart';

class HomeController extends GetxController {
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

  BannerModel bannerModel = BannerModel();
  ///Fetch category data from firebase
  Future<void> getCategory() async {
    categoryItem = [];
    update();
    await FirebaseCollections.category.get().then((QuerySnapshot querySnapshot) {
      for(var i in querySnapshot.docs){
        categoryItem.add(Category.fromJson(i.data()));
      }
    }).whenComplete(update);
  }

  Future<void> getSlider() async {
    sliderItem = [];
    update();
    await FirebaseCollections.slider.get().then((QuerySnapshot querySnapshot) {
      for(var i in querySnapshot.docs){
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


  @override
  void onInit() {
    scrollController = ScrollController()..addListener(_scrollListener);
    getCategory();
    getSlider();
    getBanner();
    super.onInit();
  }
  ///Function call when refresh home page
  void refreshHomePage() async {
    await getCategory();
    await getSlider();
    await getBanner();
    homeRefreshController.refreshCompleted();
  }

  ///Function to tooltips
  void hideToolTips() {
    showToolTips = false;
    update();
  }

  void _scrollListener() {
    update();
  }

  final List<BottomNavigationBarItem> tab = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Bookings'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.check_circle), label: 'SC Safe'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet_outlined), label: 'Rewards'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  void changeTab(int index) {
    currentTab = index;
    update();
  }

  List<String> categoryList = <String>[
    'Salon for Women',
    'Massage for Women',
    'Salon for men',
    'Massage for men',
    'AC Service & Repair',
    'Appliance repair',
    'Painter',
    'Cleaning and Disinfection',
    'Electricians',
    'Plumbers',
    'Carpenters',
    'Pest Control'
  ];
}
