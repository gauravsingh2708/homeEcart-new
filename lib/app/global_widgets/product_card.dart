import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/theme.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    height: 250,
    width: Dimens.screenWidth/2 - 48,
    margin: const EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      border: Border.all(width: 1,color: ColorsValue.primaryColor),
      borderRadius: BorderRadius.circular(5)
    ),
  );
}
