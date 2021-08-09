import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/cart_product_model.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/global_widgets/cached_image.dart';
import 'package:homeecart/app/global_widgets/price.dart';
import 'package:homeecart/app/modules/cart/controller/cart_controller.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:homeecart/app/utils/assets_constant.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: Styles.black18,
        ),
        backgroundColor: ColorsValue.primaryColor,
      ),
      body: GetBuilder<CartController>(
        builder: (_controller) => SizedBox(
          height: Dimens.screenHeight,
          width: Dimens.screenWidth,
          child: Stack(
            children: [
              SizedBox(
                height: Dimens.screenHeight - Dimens.hundred * 2.3,
                width: Dimens.screenWidth,
                child: StreamBuilder(
                    stream: FirebaseRepository().cart(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: List.generate(
                              15,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Container(
                                      width: Dimens.screenWidth,
                                      height: Dimens.fifty,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetConstants.loading,
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  )),
                        );
                      }

                      if (snapshot.data.docs.isEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your cart is Empty',
                              style: Styles.boldBlack26,
                            ),
                            Container(
                              height: Dimens.hundred * 2,
                              width: Dimens.screenWidth,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/img/empty_cart.png'))),
                            ),
                          ],
                        );
                      }
                      return ListView(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          children:
                              snapshot.data.docs.map((DocumentSnapshot document) {
                            var model = CartProduct.fromJson(document.data());
                            return Container(
                              height: Dimens.hundred * 1.5,
                              width: Dimens.screenWidth,
                              margin: EdgeInsets.symmetric(
                                  vertical: Dimens.two, horizontal: Dimens.two),
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimens.sixTeen,
                                  horizontal: Dimens.five),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 0.2, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Dimens.hundred * 1.2,
                                    width: Dimens.hundred,
                                    child: CachedImage(
                                      imageUrl: model.imageUrl,
                                    ),
                                  ),
                                  Dimens.boxWidth10,
                                  SizedBox(
                                    width:
                                        Dimens.screenWidth - Dimens.hundred * 1.3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          model.name,
                                          style: Styles.blackBold18,
                                        ),
                                        Text('${model.weight} gm'),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Price().discountPrice(
                                                    model.discountPrice),
                                                Price().price(model.price),
                                              ],
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  model.count == 1
                                                      ? IconButton(
                                                          icon: const Icon(
                                                            Icons.delete,
                                                            color: ColorsValue
                                                                .primaryColor,
                                                          ),
                                                          onPressed: () {
                                                            _controller
                                                                .removeProduct(
                                                                    document.id);
                                                          })
                                                      : IconButton(
                                                          icon: const Icon(
                                                            Icons.remove_circle,
                                                            color: ColorsValue
                                                                .primaryColor,
                                                          ),
                                                          onPressed: () {
                                                            _controller.decrementProduct(model.id);
                                                          }),
                                                  Text('${model.count}'),
                                                  IconButton(
                                                      icon: const Icon(
                                                        Icons.add_circle,
                                                        color: ColorsValue
                                                            .primaryColor,
                                                      ),
                                                      onPressed: () {
                                                        _controller.incrementProduct(model.id);
                                                      })
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList());
                    }),
              ),
              GetBuilder<UserService>(
                    builder:(_controller)=> _controller.price == 0.0
                        ? const SizedBox()
                        : Positioned(
                        bottom: 0,
                        child: Container(
                          height: Dimens.hundred * 1.55,
                          width: Dimens.screenWidth,
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimens.sixTeen, vertical: Dimens.two),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(Dimens.ten),
                              border: Border.all(width: 0.1, color: Colors.grey)),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Subtotal',
                                    style: Styles.grey16,
                                  ),
                                  Price().showPrice(_controller.price)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery Fee',
                                    style: Styles.grey16,
                                  ),
                                  Price().showPrice(0)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: Styles.boldBlack22,
                                  ),
                                  Price().showPrice(_controller.price +
                                      _controller.deliveryCharge)
                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  RoutesManagement.goToCheckout();
                                },
                                child: Container(
                                  width: Dimens.screenWidth,
                                  height: Dimens.sixty,
                                  decoration: BoxDecoration(
                                      color: ColorsValue.primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(Dimens.ten)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Checkout  ',
                                        style: Styles.white16,
                                      ),
                                      const Icon(
                                        Icons.login,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
            ],
          ),
        ),
      ));
}
