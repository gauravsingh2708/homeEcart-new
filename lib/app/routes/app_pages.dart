import 'package:get/get.dart';
import 'package:homeecart/app/modules/add_products/binding/add_product_binding.dart';
import 'package:homeecart/app/modules/add_products/view/add_product.dart';
import 'package:homeecart/app/modules/category/binding/category_binding.dart';
import 'package:homeecart/app/modules/category/view/category_view.dart';
import 'package:homeecart/app/modules/home/binding/home_binding.dart';
import 'package:homeecart/app/modules/home/view/home_view.dart';
import 'package:homeecart/app/modules/login/binding/login_binding.dart';
import 'package:homeecart/app/modules/login/view/login_view.dart';
import 'package:homeecart/app/modules/login/view/page/otp_view.dart';
import 'package:homeecart/app/modules/search/binding/search_binding.dart';
import 'package:homeecart/app/modules/search/view/search_view.dart';


part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
///                 and will be used in the material app.
abstract class AppPages{

  static var transitionDuration = const Duration(
    milliseconds: 300,
  );

  static final pages = <GetPage>[
    GetPage(
      name: _Paths.login,
      transitionDuration: transitionDuration,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.home,
      transitionDuration: transitionDuration,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.category,
      transitionDuration: transitionDuration,
      page: () => CategoryView(),
      binding: CategoryBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: _Paths.otpScreen,
      transitionDuration: transitionDuration,
      page: () => OtpView(),
      binding: LoginBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.search,
      transitionDuration: transitionDuration,
      page: () => SearchView(),
      binding: SearchBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.addProduct,
      transitionDuration: transitionDuration,
      page: () => AddProductView(),
      binding: AddProductBinding(),
      transition: Transition.downToUp,
    ),
  ];

}