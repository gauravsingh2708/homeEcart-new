import 'package:flutter/material.dart';
import 'package:homeecart/app/global_widgets/cached_image.dart';
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
    child: CachedImage(imageUrl: imageUrl,),
  );
}
