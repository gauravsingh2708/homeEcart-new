import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/network_model/user.dart';
import 'package:homeecart/app/routes/app_pages.dart';
import 'package:get/get.dart';

/// A chunk of routes taken in the application.
abstract class RoutesManagement {
  /// Go to the home screen.
  static void goToHome() {
    Get.offAllNamed<void>(AppRoutes.home);
  }

  /// Go to the home screen.
  static void goToOtpScreen() {
    Get.toNamed<void>(AppRoutes.otpScreen);
  }

  /// Go to the login screen.
  static void goToLoginScreen() {
    Get.offAllNamed<void>(AppRoutes.login);
  }

  /// Go to the category screen.
  static void goToCategoryScreen(String title, String id) {
    Get.toNamed<void>(
      AppRoutes.category,
      arguments: <String, dynamic>{'title': title, 'id': id},
    );
  }

  /// Go to the edit address screen.
  static void goToEditAddressScreen(String mobile, String uid) {
    Get.toNamed<void>(
      AppRoutes.editAddress,
      arguments: <String, dynamic>{'mobile': mobile, 'uid': uid},
    );
  }

  static void goToCart() {
    Get.toNamed<void>(
      AppRoutes.cart,
    );
  }

  static void goToCheckout() {
    Get.toNamed<void>(
      AppRoutes.checkout,
    );
  }

  static void goToEditDetails(Category category) {
    Get.toNamed<void>(AppRoutes.editDetails, arguments: category);
  }

  static void goToEditProfile(UserModel userModel) {
    Get.toNamed<void>(AppRoutes.editProfile, arguments: userModel);
  }

  static void goToAllCategory() {
    Get.toNamed<void>(
      AppRoutes.allCategory,
    );
  }

  static void goToSearchScreen() {
    Get.toNamed<void>(
      AppRoutes.addProduct,
    );
  }

  static void goToAdminScreen() {
    Get.toNamed<void>(
      AppRoutes.admin,
    );
  }

  static void goToAddProductScreen() {
    Get.toNamed<dynamic>(AppRoutes.addProduct);
  }

  static void goToProductScreen() {
    Get.toNamed<dynamic>(AppRoutes.product);
  }

  static void goToAddCategoryScreen() {
    Get.toNamed<dynamic>(AppRoutes.addCategory);
  }

  static void goToAdminCategoryScreen() {
    Get.toNamed<dynamic>(AppRoutes.adminCategory);
  }

  static void goToEditProductScreen(Product product) {
    Get.toNamed<dynamic>(AppRoutes.editProduct, arguments: product);
  }
}
