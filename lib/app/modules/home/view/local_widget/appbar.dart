import 'package:flutter/material.dart';
import 'package:homeecart/app/theme/theme.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({this.index});
  final int index;
  @override
  Widget build(BuildContext context){
    if(index == 0){
      return AppBar(
        backgroundColor: Colors.white,
        title: Text('HomeEcart',style: Styles.black18,),
        actions: [
          IconButton(icon: Icon(Icons.search,size: Dimens.twenty,), onPressed:(){})
        ],
      );
    }
    if(index == 1){
      return AppBar(
        backgroundColor: Colors.white,
        title: Text('HomeEcart',style: Styles.black18,),
        actions: [
          IconButton(icon: Icon(Icons.search,size: Dimens.twenty,), onPressed:(){})
        ],
      );
    }
    if(index == 2){
      return AppBar(
        backgroundColor: Colors.white,
        title: Text('HomeEcart',style: Styles.black18,),
        actions: [
          IconButton(icon: Icon(Icons.search,size: Dimens.twenty,), onPressed:(){})
        ],
      );
    }
    if(index == 3){
      return AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile',style: Styles.black18,),
      );
    }

    return AppBar();
  }
}
