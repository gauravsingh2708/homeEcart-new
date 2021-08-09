import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/theme.dart';

class Con extends StatelessWidget {
  Con({this.title,this.function});
  final String title;
  final Function function;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: ()=>function(),
    child: Container(
      width: Dimens.screenWidth/2,
      height: Dimens.hundred,
      decoration: BoxDecoration(
          color: ColorsValue.primaryColor.withOpacity(0.1),
          border: Border.all(color: Colors.black,width: 0.3),
          borderRadius: BorderRadius.circular(20)
      ),
      child: Center(child: Text(title)),
    ),
  );
}
