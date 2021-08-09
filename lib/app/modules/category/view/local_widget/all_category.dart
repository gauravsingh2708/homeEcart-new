import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/global_widgets/cached_image.dart';
import 'package:homeecart/app/modules/home/controller/home_controller.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';

class AllCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Category',style: Styles.black18,),
    ),
    body: GetBuilder<HomeController>(
      builder:(_controller)=> SizedBox(
        height: Dimens.hundred*1.05*(_controller.categoryItem.length/4).ceil(),
        width: Dimens.screenWidth,
        child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(_controller.categoryItem.length, (index)=> InkWell(
              onTap: () {
                RoutesManagement.goToCategoryScreen(_controller.categoryItem[index].name,_controller.categoryItem[index].id);
              },
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                    )
                  ]
                ),
                width: Dimens.screenWidth / 4- 0.3,
                height: 310/3,
                child: Material(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 5,),
                      SizedBox(
                        width: Dimens.screenWidth / 4 - 0.3,
                        height: Dimens.fifty,
                        child: CachedImage(imageUrl:_controller.categoryItem[index].imageUrl),
                      ),
                      SizedBox(height: Dimens.ten,),
                      Text(_controller.categoryItem[index].name,style: Styles.black12,textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            ))
        ),
      ),
    ),
  );
}
