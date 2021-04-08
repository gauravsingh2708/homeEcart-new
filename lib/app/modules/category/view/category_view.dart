import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/modules/category/controller/category_controller.dart';
import 'package:homeecart/app/modules/category/view/local_widget/product_grid_view.dart';
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
      ),
      body: ProductGridView(productList: _controller.productList,),
    ),
  ));
}
