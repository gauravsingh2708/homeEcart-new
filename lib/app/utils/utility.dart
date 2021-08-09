import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/location_details.dart';
import 'package:homeecart/app/global_widgets/no_internet_widget.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:logger/logger.dart';
import 'package:geocoder/geocoder.dart' as geocoder;


abstract class Utility{
  /// Print debug log.
  ///
  /// [message] : The message which needed to be print.
  static void printDLog(String message) {
    Logger().d('$message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(String message) {
    Logger().i('$message');
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('$message');
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }
  /// Show no internet dialog if there is no
  /// internet available.
  static void showNoInternetDialog() {
    closeDialog();
    Get.dialog<void>(
      NoInternetWidget(),
      barrierDismissible: false,
    );
  }

  /// Show a loading progress indicator
  /// on top of the screen.
  static void showLoadingDialog() {
    closeDialog();
    Get.dialog<void>(
      WillPopScope(
        onWillPop: () async => false,
        child: Align(
          alignment: Alignment.center,
          child: Wrap(
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorsValue.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Show an error snack bar.
  ///
  /// [message] : error message.
  static void showError(String message) {
    closeSnackBar();
    closeDialog();
    closeBottomSheet();
    if (message == null || message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: Styles.white16,
      ),
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: Text(
          'Okay',
          style: Styles.white14,
        ),
      ),
      backgroundColor: Colors.red,
      margin: Dimens.edgeInsets15,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Close any open snack bar.
  static void closeSnackBar() {
    if (Get.isSnackbarOpen ?? false) Get.back<void>();
  }

  /// Get all location details from the address object.
  ///
  /// [locationDetails] : the location details got from geocoder.
  static LocationData getLocationData(geocoder.Address locationDetails) =>
      LocationData(
        placeName: locationDetails.subLocality ,
        addressLine1: locationDetails.addressLine,
        addressLine2: locationDetails.adminArea,
        area: locationDetails.subAdminArea,
        city: locationDetails.locality,
        postalCode: locationDetails.postalCode,
        country: locationDetails.countryName,
        latitude: locationDetails.coordinates.latitude,
        longitude: locationDetails.coordinates.longitude,
      );

  /// Get current lat long of the device.
  static Future<Position> getCurrentLatLng() async =>
      await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

  /// Get current location in string.
  static Future<LocationData> getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    var locationDetails = await getAddressThroughLatLng(position.latitude, position.longitude);
    return getLocationData(locationDetails);
  }

  /// Get the location name by giving the lat long.
  ///
  /// [latitude] : latitude of the location.
  /// [longitude] : longitude of the location.
  static Future<geocoder.Address> getAddressThroughLatLng(
      double latitude, double longitude) async {
    geocoder.Address first;
    if (latitude != null && longitude != null) {
      final coordinates = geocoder.Coordinates(latitude, longitude);
      var addresses = await geocoder.Geocoder.local
          .findAddressesFromCoordinates(coordinates);
      if (addresses != null || addresses.isNotEmpty) {
        first = addresses.first;
      } else {
        first = null;
      }
    }
    return first;
  }

  /// Close any open bottom sheet.
  static void closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  }

  /// Dialog to ask user to enable a service which is required to perform
  /// some operation.
  ///
  /// [title] : The title of the service required.
  /// [message] : The message of the service required.
  static void askToEnableServiceFromSetting(String title, String message) {
    Get.defaultDialog<void>(
      title: title,
      content: Text(
        message,
        style: Get.textTheme.bodyText2,
        textAlign: TextAlign.center,
      ),
      titleStyle: Styles.black18,
      confirm: FlatButton(
        color: ColorsValue.primaryColor,
        onPressed: () {
          Geolocator.openAppSettings();
          Get.back<void>();
        },
        child: Text(
          'ok',
          style: Styles.white14,
        ),
      ),
      cancel: FlatButton(
        color: Colors.white,
        onPressed: () {
          Get.back<void>();
        },
        child: Text(
          'cancel',
          style: Styles.appColor14,
        ),
      ),
      onCancel: () {},
    );
  }
}