import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/modules/admin/controller/admin_controller.dart';
import 'package:homeecart/app/modules/admin/view/local_widget/container.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';

class AdminView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: GetBuilder<AdminController>(
      builder:(_con)=> Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Dimens.sixTeen),
          child: ListView(
            shrinkWrap: true,
            children: [
              _con.marketModel == null?const Text(' '):Text('${_con.marketModel.name}',style: Styles.boldBlack22,),
              Container(
                width: Dimens.screenWidth,
                height: Dimens.hundred*2,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 0.3),
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
              Dimens.boxHeight5,
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimens.twenty),
                width: Dimens.screenWidth,
                height: Dimens.hundred*0.7,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 0.3),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Value of Product Stock',style: Styles.boldBlack22,),
                    Text('28476',style: Styles.boldBlack22,),
                  ],
                ),
              ),
              Dimens.boxHeight5,
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimens.twenty),
                width: Dimens.screenWidth,
                height: Dimens.hundred*0.7,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 0.3),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's Sales",style: Styles.boldBlack22,),
                    Text('1000',style: Styles.boldBlack22,),
                  ],
                ),
              ),
              Dimens.boxHeight5,
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimens.twenty),
                width: Dimens.screenWidth,
                height: Dimens.hundred*0.7,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 0.3),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today's Orders",style: Styles.boldBlack22,),
                    Text('100',style: Styles.boldBlack22,),
                  ],
                ),
              ),
              Dimens.boxHeight5,
              GridView.count(
                childAspectRatio: 2/1,
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Con(title: 'Orders',),
                  Con(title: 'Products',function: RoutesManagement.goToProductScreen,),
                  Con(title: 'Category',function: RoutesManagement.goToAdminCategoryScreen,),
                  Con(title: 'Markets',),
                  Con(title: 'Posts',),
                  Con(title: 'Settings',)
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
