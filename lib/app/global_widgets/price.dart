import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/Theme.dart';

class Price {
  Widget discountPrice(double price) => Row(
    children: [
      Text('₹',style: Styles.black18),
      Text(
            '$price',
            style: Styles.black18.copyWith(fontSize:Dimens.twentyTwo),
          ),
    ],
  );
  Widget price(double price) => Text('M.R.P ₹ $price',
      style: Styles.grey16.copyWith(decoration: TextDecoration.lineThrough));
  Widget saveAmount(double price, double discountPrice) => Text(
        'Save ₹ ${price - discountPrice}',
        style: Styles.white16.copyWith(color: Colors.red),
      );
}
