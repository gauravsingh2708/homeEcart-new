import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/dimens.dart';

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: Dimens.screenWidth,
    height: Dimens.sixty,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.black,width: 0.3)
    ),
  );
}
