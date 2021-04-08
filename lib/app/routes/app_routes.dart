part of 'app_pages.dart';


/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class AppRoutes{
  static const arCore = _Paths.arCore;
  static const login = _Paths.login;
  static const home = _Paths.home;
  static const otpScreen = _Paths.otpScreen;
  static const category = _Paths.category;
  static const search = _Paths.search;
  static const addProduct = _Paths.addProduct;
}

abstract class _Paths{
  static const arCore = '/ar_core';
  static const login = '/login';
  static const home = '/home';
  static const otpScreen = '/otp_screen';
  static const category = '/category_screen';
  static const search = '/search_screen';
  static const addProduct = '/add_product';
}