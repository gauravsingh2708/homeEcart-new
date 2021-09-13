import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/global_widgets/cached_image.dart';
import 'package:homeecart/app/modules/search/controller/search_controller.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:homeecart/app/utils/assets_constant.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<SearchController>(
    builder:(_controller)=> Scaffold(
      appBar: AppBar(
        title: Container(
          height: Dimens.fourty,
          decoration: BoxDecoration(
              border: Border.all(width: 0.2),
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextFormField(
            decoration: const InputDecoration(
                border: InputBorder.none
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: StreamBuilder(
          stream: FirebaseRepository().product(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                  children: List.generate(
                      4,
                          (index) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: Dimens.screenWidth,
                          height: Dimens.fifty,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetConstants.loading,
                                  fit: BoxFit.cover)),
                        ),
                      )));
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal:16.0),
              child: ListView(
                  children:
                  snapshot.data.docs.map((DocumentSnapshot document) {
                    var model = Product.fromJson(document.data());
                    return Container(
                      height: Dimens.hundred * 1.8,
                      width: Dimens.screenWidth,
                      margin: EdgeInsets.symmetric(vertical: Dimens.two),
                      decoration: BoxDecoration(
                          border: Border.all(width: Dimens.one * 0.5),
                          borderRadius: BorderRadius.circular(Dimens.ten)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Dimens.hundred * 1.5,
                            width: Dimens.hundred * 1.5,
                            child: CachedImage(
                              imageUrl: model.imageUrl,
                            ),
                          ),
                          Dimens.boxWidth10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(model.name),
                              Text(model.categoryName),
                              Text('Price: ${model.price}'),
                              Text('Discount Rate: ${model.discountPrice}'),
                              Text('Weight ${model.weight}'),
                              GetBuilder<UserService>(
                                builder: (_controller) => _controller
                                    .checkProductInCart(model.id)
                                    ? SizedBox(
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      _controller
                                          .productListInCart[
                                      _controller
                                          .indexOfProduct(
                                          model.id)]
                                          .count ==
                                          1
                                          ? IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: ColorsValue
                                                .primaryColor,
                                          ),
                                          onPressed: () {
                                            _controller.removeProduct(
                                                model.id);
                                          })
                                          : IconButton(
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: ColorsValue
                                                .primaryColor,
                                          ),
                                          onPressed: () {
                                            _controller
                                                .decrementProduct(
                                                model.id);
                                          }),
                                      Text(
                                        '${_controller.productListInCart[_controller.indexOfProduct(model.id)].count}',
                                        style: Styles.black18
                                            .copyWith(height: 1.8),
                                      ),
                                      IconButton(
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: ColorsValue.primaryColor,
                                          ),
                                          onPressed: () {
                                            _controller
                                                .incrementProduct(model.id);
                                          })
                                    ],
                                  ),
                                )
                                    : InkWell(
                                  onTap: () {
                                    _controller.addProductToCart(model);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: Dimens.hundred * 1.2,
                                    decoration: BoxDecoration(
                                        color: ColorsValue.primaryColor
                                            .withOpacity(0.4),
                                        borderRadius:
                                        BorderRadius.circular(5),
                                        border: Border.all(
                                            width: 0.4,
                                            color:
                                            ColorsValue.primaryColor)),
                                    child: Center(
                                        child: Text(
                                          'Add to Cart',
                                          style: Styles.boldBlack16,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList()),
            );
          }),
    ),
  );
}
