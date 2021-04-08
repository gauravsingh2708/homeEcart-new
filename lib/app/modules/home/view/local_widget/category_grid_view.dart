import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/modules/home/controller/home_controller.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';

class CategoryGridView extends StatelessWidget {

  CategoryGridView({this.categoryItem});
  final List<Category> categoryItem;

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder:(_controller)=> Column(
      children: [
        Container(
            height: 307.5,
            width: Dimens.screenWidth,
            color: Colors.grey,
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 1,
              // mainAxisSpacing: 0.5,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(12, (index)=> InkWell(
                onTap: () {
                  RoutesManagement.goToCategoryScreen(categoryItem[index].name,categoryItem[index].id);
                },
                child: Container(
                  width: Dimens.screenWidth / 4- 0.3,
                  height: 310/3,
                  margin: const EdgeInsets.only(top: 1),
                  child: Material(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 5,),
                          SizedBox(
                            width: Dimens.screenWidth / 4 - 0.3,
                            height: 50,
                            child: Ink.image(
                              image: NetworkImage(categoryItem[index].imageUrl),
                              // const AssetImage('assets/img/cat1.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(categoryItem[index].name,style: Styles.black12,textAlign: TextAlign.center,)
                        ],
                      ),
                    ),
                ),
              ))
            ),
          ),
        Container(
          height: Dimens.eighty,
          width: Dimens.screenWidth,
          color: Colors.white,
          child: Center(
            child:  InkWell(
              onTap: () {
                _controller.getCategory();
              },
              hoverColor: Colors.grey,
              child: Container(
                height: 48,
                width: Dimens.screenWidth,
                margin: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 0.5, color: ColorsValue.primaryColor),
                    color: ColorsValue.primaryColor.withOpacity(0.1)),
                child: Center(
                  child: Text(
                    'View All Category',
                    style: Styles.grey14.copyWith(color: ColorsValue.primaryColor),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
