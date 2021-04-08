import 'package:flutter/material.dart';
Widget loadingWidget({double height,double width,EdgeInsetsGeometry padding})=> Container(
  height: height,
  width: width,
  margin: padding,
  decoration: const BoxDecoration(
      image: DecorationImage(
          image:  AssetImage('assets/img/loading.gif')
      )
  ),
);