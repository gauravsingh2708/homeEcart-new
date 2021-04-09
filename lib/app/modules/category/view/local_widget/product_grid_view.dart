import 'package:flutter/material.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/global_widgets/product_card.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({this.productList});
  final List<Product> productList;
  @override
  Widget build(BuildContext context) => Container(
    color: Colors.grey,
    child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        childAspectRatio: 5.5 / 9.0,
        mainAxisSpacing: 1,
        // mainAxisSpacing: 0.5,
        children: List.generate(productList.length, (index)=> productCard(productInfo: productList[index],))
    ),
  );
}
