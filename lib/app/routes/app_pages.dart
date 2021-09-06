import 'package:get/get.dart';
import 'package:homeecart/app/modules/add_details/binding/add_product_binding.dart';
import 'package:homeecart/app/modules/add_details/view/add_category.dart';
import 'package:homeecart/app/modules/add_details/view/add_product.dart';
import 'package:homeecart/app/modules/admin/binding/admin_binding.dart';
import 'package:homeecart/app/modules/admin/binding/edit_deatils_binding.dart';
import 'package:homeecart/app/modules/admin/view/admin_view.dart';
import 'package:homeecart/app/modules/admin/view/page/category.dart';
import 'package:homeecart/app/modules/admin/view/page/edit_category.dart';
import 'package:homeecart/app/modules/admin/view/page/product.dart';
import 'package:homeecart/app/modules/cart/binding/cart_binding.dart';
import 'package:homeecart/app/modules/cart/view/cart_view.dart';
import 'package:homeecart/app/modules/category/binding/category_binding.dart';
import 'package:homeecart/app/modules/category/view/category_view.dart';
import 'package:homeecart/app/modules/category/view/local_widget/all_category.dart';
import 'package:homeecart/app/modules/checkout/binding/checkout_binding.dart';
import 'package:homeecart/app/modules/checkout/view/checkout_view.dart';
import 'package:homeecart/app/modules/edit_address/binding/edit_address_binding.dart';
import 'package:homeecart/app/modules/edit_address/view/edit_address_view.dart';
import 'package:homeecart/app/modules/edit_profile/binding/edit_profile_binding.dart';
import 'package:homeecart/app/modules/edit_profile/view/edit_profile_view.dart';
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
abstract class AppPages {
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
      name: _Paths.editProfile,
      transitionDuration: transitionDuration,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
      transition: Transition.downToUp,
    ),

    GetPage(
      name: _Paths.checkout,
      transitionDuration: transitionDuration,
      page: () => CheckoutView(),
      binding: CheckoutBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.editAddress,
      transitionDuration: transitionDuration,
      page: () => EditAddressView(),
      binding: EditAddressBinding(),
      transition: Transition.downToUp,
    ),


    /// Admin pages
    ///
    GetPage(
      name: _Paths.admin,
      transitionDuration: transitionDuration,
      page: () => AdminView(),
      binding: AdminBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.product,
      transitionDuration: transitionDuration,
      page: () => Products(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.addProduct,
      transitionDuration: transitionDuration,
      page: () => AddProductView(),
      binding: AddProductBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.adminCategory,
      transitionDuration: transitionDuration,
      page: () => CategoryAdd(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.addCategory,
      transitionDuration: transitionDuration,
      page: () => AddCategory(),
      binding: AddProductBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.editDetails,
      transitionDuration: transitionDuration,
      page: () => EditDetails(),
      binding: EditDetailsBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.allCategory,
      transitionDuration: transitionDuration,
      page: () => AllCategory(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.cart,
      transitionDuration: transitionDuration,
      page: () => CartView(),
      binding: CartBinding(),
      transition: Transition.downToUp,
    ),
  ];
}
