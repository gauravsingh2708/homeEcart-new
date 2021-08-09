import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/global_widgets/price.dart';
import 'package:homeecart/app/theme/theme.dart';

Widget productCard({Product productInfo}) => Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: Dimens.screenWidth / 2 - 48,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(productInfo.imageUrl))),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              productInfo.name,
              style: Styles.black18,
            ),
            Expanded(
              child: Container(),
            ),
            const SizedBox(
              height: 5,
            ),
            Price().discountPrice(productInfo.discountPrice),
            const SizedBox(
              height: 5,
            ),
            Price().price(productInfo.price),
            Price().saveAmount(productInfo.price, productInfo.discountPrice),
            const SizedBox(
              height: 5,
            ),
            GetBuilder<UserService>(
              builder: (_controller) => _controller
                      .checkProductInCart(productInfo.id)
                  ? SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _controller
                                      .productListInCart[_controller
                                          .indexOfProduct(productInfo.id)]
                                      .count ==
                                  1
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: ColorsValue.primaryColor,
                                  ),
                                  onPressed: () {
                                    _controller.removeProduct(productInfo.id);
                                  })
                              : IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: ColorsValue.primaryColor,
                                  ),
                                  onPressed: () {
                                    _controller
                                        .decrementProduct(productInfo.id);
                                  }),
                          Text(
                            '${_controller.productListInCart[_controller.indexOfProduct(productInfo.id)].count}',
                            style: Styles.black18.copyWith(height: 1.8),
                          ),
                          IconButton(
                              icon: const Icon(
                                Icons.add_circle,
                                color: ColorsValue.primaryColor,
                              ),
                              onPressed: () {
                                _controller.incrementProduct(productInfo.id);
                              })
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        _controller.addProductToCart(productInfo);
                      },
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: ColorsValue.primaryColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 0.4, color: ColorsValue.primaryColor)),
                        child: Center(
                            child: Text(
                          'Add to Cart',
                          style: Styles.boldBlack16,
                        )),
                      ),
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
