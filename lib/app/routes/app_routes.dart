part of 'app_pages.dart';


/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class AppRoutes{
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const otpScreen = _Paths.otpScreen;
  static const category = _Paths.category;
  static const search = _Paths.search;
  static const cart = _Paths.cart;
  /// Routes for admin panel
  static const admin = _Paths.admin;
  static const product = _Paths.product;
  static const addProduct = _Paths.addProduct;
  static const addCategory = _Paths.addCategory;
  static const adminCategory = _Paths.adminCategory;
  static const editDetails = _Paths.editDetails;
  static const allCategory = _Paths.allCategory;
  static const editProfile = _Paths.editProfile;
  static const checkout = _Paths.checkout;
}

abstract class _Paths{
  static const login = '/login';
  static const home = '/home';
  static const otpScreen = '/otp_screen';
  static const category = '/category_screen';
  static const search = '/search_screen';
  static const allCategory = '/all_category';
  static const cart = '/cart';
  static const editProfile = '/edit_profile';
  static const checkout = '/checkout';
  /// Routes for admin panel
  static const admin = '/admin';
  static const product = '/product';
  static const addProduct = '/add_product';
  static const addCategory = '/add_category';
  static const adminCategory = '/admin_category';
  static const editDetails = '/edit_details';
}