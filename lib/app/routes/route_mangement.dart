import 'package:homeecart/app/routes/app_pages.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
abstract class RoutesManagement{
  /// Go to the home screen.
  static void goToHome() {
    Get.offAllNamed<void>(
      AppRoutes.home
    );
  }

  /// Go to the home screen.
  static void goToOtpScreen() {
    Get.toNamed<void>(
        AppRoutes.otpScreen
    );
  }

  /// Go to the home screen.
  static void goToCategoryScreen(String title, int id) {
    Get.toNamed<void>(
        AppRoutes.category,
      arguments: <String, dynamic>{
        'title': title,
        'id' : id
      },
    );
  }
  static void goToSearchScreen() {
    Get.toNamed<void>(
      AppRoutes.addProduct,
    );
  }
}