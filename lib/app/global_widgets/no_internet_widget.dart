import 'package:flutter/material.dart';
import 'package:heat_dance/app/theme/theme.dart';
import 'package:heat_dance/app/utils/utils.dart';
import 'package:homeecart/app/theme/theme.dart';

/// A no internet widget which will be shown if network connection is not
/// available.
class NoInternetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black12,
    body: Padding(
      padding: Dimens.edgeInsets15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringConstants.noInternet,
            textAlign: TextAlign.center,
            style: Styles.boldWhite23,
          ),
        ],
      ),
    ),
  );
}
