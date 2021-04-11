import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/utils/utility.dart';

/// A controller which will be used to handle the basic
/// operations in the application. This will be used to separate the UI related
/// work like controllers, permission and etc.
class CommonService extends GetxController{
  /// This is used for internet change listener
  StreamSubscription _streamSubscription;

  /// Starts the check for internet connectivity. If there is no connection
  /// with the internet a text message will be shown. If the application
  /// is not able to connect to the internet even if the connection is available
  /// will ask the user to check the internet permission.
  void _checkForInternetConnectivity() {
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

}