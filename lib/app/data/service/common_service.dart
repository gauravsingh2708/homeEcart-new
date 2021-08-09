import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/location_details.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:homeecart/app/utils/permissions.dart';
import 'package:homeecart/app/utils/utility.dart';
import 'package:image_picker/image_picker.dart';

/// A controller which will be used to handle the basic
/// operations in the application. This will be used to separate the UI related
/// work like controllers, permission and etc.
class CommonService extends GetxController {
  /// This is used for internet change listener
  StreamSubscription _streamSubscription;

  ///This is used store the count of the product in cart
  int cartCount = 2;

  String currentUserUid = '';


  ///Variable to store current location
  LocationData locationData = LocationData();

  Future<void> addProductToCart(int id) async {}

  void getCurrentUser() {
    var user = FirebaseAuth.instance.currentUser;
    currentUserUid = user == null ? '' : user.uid;
    Utility.printDLog('Current user uid: $currentUserUid');
    update();
  }

  @override
  void onInit() async{
    getCurrentUser();
    getCurrentLocation();
    _checkForInternetConnectivity();
    super.onInit();
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }

  /// Starts the check for internet connectivity. If there is no connection
  /// with the internet a text message will be shown. If the application
  /// is not able to connect to the internet even if the connection is available
  /// will ask the user to check the internet permission.
  void _checkForInternetConnectivity() {
    Utility.printDLog('Internet connectivity is checking');
    _streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        Utility.closeDialog();
      } else {
        Utility.showNoInternetDialog();
      }
    });
  }

  final picker = ImagePicker();

  /// Opens the gallery/file application for the user to pick the image.
  Future<File> getImageFromGallery() async {
    File file;
    if (await Permissions.checkStoragePermission()) {
      final pickedFile = await picker.getImage(
          source: ImageSource.gallery,
          imageQuality: 50
      );
      if (pickedFile != null) {
        file = File(pickedFile.path);
      } else {
        Utility.showError('imageNotFoundError');
      }
    }
    return file;
  }

  /// Returns a Future string which will be a url of the image
  /// send to the FireStore.
  ///
  /// [fileToUpload] : The file which needs to upload.
  Future<String> uploadImageOnFireStore(File fileToUpload,String index) async {
    try {
      return await FirebaseRepository().uploadImage(fileToUpload,index);
    } on Exception {
      Utility.showError('Error on upload file on Sever');
    }
    return '';
  }

  /// Gives the current location of the user which will be shown in
  /// the location field.
  void getCurrentLocation() async {
    if (await Permissions.checkLocationPermission(true) != null) {
      var currentLocationData = await Utility.getCurrentLocation();
      if (currentLocationData != null) {
        locationData = currentLocationData;
        update();
        Utility.printDLog('${currentLocationData.addressLine1}');
      } else {
        Utility.showError(
          'StringConstants.errorGettingCurrentLocation',
        );
      }
    }
  }

  void showLocationBottomSheet() {
    Get.bottomSheet<dynamic>(
        Container(
          padding: EdgeInsets.all(Dimens.sixTeen),
          height: Dimens.hundred * 3 + Dimens.fourty,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose your location',
                style: Styles.boldBlack22.copyWith(fontWeight: FontWeight.w500,fontSize: 18),
              ),
              Dimens.boxHeight10,
              Text(
                'Select a delivery location to see product availability and delivery option',
                style: Styles.black18.copyWith(fontSize: 14,color: Colors.black54,fontWeight: FontWeight.w400,wordSpacing: 2),
                softWrap: true,
              ),
              Dimens.boxHeight15,
              Row(
                children: [
                  Container(
                    height: Dimens.hundred*1.5,
                    width: Dimens.hundred*1.5,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2,color: Colors.grey)
                    ),
                    child: Center(child: Text('Add an address',style: Styles.black18.copyWith(color: ColorsValue.primaryColor),textAlign: TextAlign.center,),),
                  )
                ],
              ),
              Dimens.boxHeight10,
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(vertical: 5),
                width: Dimens.screenWidth,
                color: Colors.white,
                child: Row(
                  children: [
                    Icon(Icons.gps_fixed,size: Dimens.twenty,color: ColorsValue.primaryColor,),
                    Text(
                      '  Use my current location',
                      style: Styles.black12
                          .copyWith(fontWeight: FontWeight.w600, height: 1.8,color: ColorsValue.primaryColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        enableDrag: true);
  }
}
