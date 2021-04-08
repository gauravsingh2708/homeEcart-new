import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/theme.dart';

class Poster extends StatelessWidget {
  Poster({this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) => Container(
    height: 170,
    width: Dimens.screenWidth,
    margin: const EdgeInsets.symmetric(
      vertical: 2,
      horizontal: 2,
    ),
    decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.fitWidth,
          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
        )),
  );
}
