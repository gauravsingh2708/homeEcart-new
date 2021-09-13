import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/modules/category/controller/category_controller.dart';
import 'package:homeecart/app/modules/category/view/local_widget/product_grid_view.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(child: GetBuilder<CategoryController>(
    init: Get.find()..initialSetup(Get.arguments as Map<String, dynamic>),
    builder: (_controller)=>Scaffold(
      appBar: AppBar(
        title: Text(_controller.title.toString(),style: Styles.black18,),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          Stack(children: [
            IconButton(
                icon: Icon(
                  Icons.add_shopping_cart,
                  size: Dimens.twentyEight,
                ),
                onPressed: () {
                  RoutesManagement.goToCart();
                }),
            Positioned(
                top: 10,
                left: 19,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: Center(
                      child: GetBuilder<UserService>(
                        builder: (_controller) => Text(
                          '${_controller.cartCount}',
                          style: Styles.boldBlack16.copyWith(fontSize: 10),
                        ),
                      )),
                )),
          ]),
          Dimens.boxWidth20
        ],
      ),
      body: ProductGridView(productList: _controller.productList,),
    ),
  ));
}
