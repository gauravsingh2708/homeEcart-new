import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:homeecart/app/utils/assets_constant.dart';

class CachedImage extends StatelessWidget {
  CachedImage({this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimens.infinite,
      width: Dimens.infinite,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          height: Dimens.infinite,
          width: Dimens.infinite,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetConstants.loading, fit: BoxFit.cover)),
        ),
        errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
      ),
    );;
  }
}
