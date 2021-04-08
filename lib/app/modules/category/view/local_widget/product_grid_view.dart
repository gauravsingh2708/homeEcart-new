import 'package:flutter/material.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/global_widgets/product_card.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({this.productList});
  final List<Product> productList;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: GridView.count(
        crossAxisCount: 8,
        crossAxisSpacing: 1,
        // mainAxisSpacing: 0.5,
        children: List.generate(productList.length, (index)=> InkWell(
          onTap: () {
            // RoutesManagement.goToCategoryScreen(categoryItem[index].name,categoryItem[index].id);
          },
          child: ProductCard(),
        ))
    ),
  );
}
