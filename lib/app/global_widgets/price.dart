import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/Theme.dart';

class Price {
  Widget discountPrice(double price) => Row(
    children: [
      Text('Offer Price:₹',style: Styles.black12),
      Text(
            '$price',
            style: Styles.black18.copyWith(fontSize:Dimens.twentyTwo),
          ),
    ],
  );

  Widget showPrice(double price) => Row(
    children: [
      Text('₹',style: Styles.black18),
      Text(
        '$price',
        style: Styles.black18,
      ),
    ],
  );

  Widget price(double price) => Text('Price ₹ $price',
      style: Styles.grey16.copyWith(decoration: TextDecoration.lineThrough));
  Widget saveAmount(double price, double discountPrice) => Text(
        'Save ₹ ${(price - discountPrice).truncateToDouble()}',
        style: Styles.white16.copyWith(color: Colors.red),
      );
}
