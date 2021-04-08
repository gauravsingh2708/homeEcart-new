import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/theme.dart';

class ProfileTile extends StatelessWidget {

  ProfileTile({this.title,this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Container(
    height: 47,
    width: Dimens.screenWidth,
    color: Colors.white,
    child: Row(
      children: [
        const SizedBox(width: 20,),
        Icon(icon),
        const SizedBox(width: 20,),
        Text('$title',style: Styles.black12.copyWith(fontSize: 14,fontWeight: FontWeight.w600),)
      ],
    ),
  );
}
