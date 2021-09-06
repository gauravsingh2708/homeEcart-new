import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/cart_product_model.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/global_widgets/price.dart';
import 'package:homeecart/app/modules/checkout/controller/checkout_controller.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:homeecart/app/utils/assets_constant.dart';

class CheckoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsValue.primaryColor,
          title: Text(
            'Order Summary',
            style: Styles.white16,
          ),
        ),
        body: GetBuilder<UserService>(
          builder: (_controller) => SingleChildScrollView(
              child: Column(
            children: [
              StreamBuilder(
                  stream: FirebaseRepository().cart(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                            15,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Container(
                                    width: Dimens.screenWidth,
                                    height: Dimens.fifty,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetConstants.loading,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                )),
                      );
                    }
                    return DataTable(
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Name',
                            style: Styles.black12,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Qty',
                            style: Styles.black12,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Price',
                            style: Styles.black12,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Subtotal',
                            style: Styles.black12,
                          ),
                        ),
                      ],
                      rows: snapshot.data.docs.map((DocumentSnapshot document) {
                        var model = CartProduct.fromJson(document.data());
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(model.name),
                            ),
                            DataCell(
                              Text('${model.count}'),
                            ),
                            DataCell(
                              Text('${model.discountPrice}'),
                            ),
                            DataCell(
                              Text('${model.count * model.discountPrice}'),
                            ),
                          ],
                        );
                      }).toList(),
                      showBottomBorder: true,
                    );
                  }),
              Dimens.boxHeight20,
              GetBuilder<CheckoutController>(
                builder:(_con)=> Container(
                  // height: Dimens.hundred * 3,
                  width: Dimens.screenWidth,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.sixTeen, vertical: Dimens.eight),
                  margin: EdgeInsets.symmetric(horizontal: Dimens.eight,vertical: Dimens.eight),
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: ColorsValue.primaryColor
                      )
                    ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(Dimens.ten),
                      border: Border.all(width: 0.1, color: Colors.grey)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Select Address',style: Styles.white16.copyWith(color: ColorsValue.primaryColor),),

                      Container(
                        child: Row(
                          children: [
                            const Checkbox(value: true,),
                            Flexible(child: Text(_controller.userModel.address))
                          ],
                        ),
                      ),
                      Dimens.boxHeight20,
                      InkWell(
                        onTap: (){
                          _con.editAddress(_controller.userModel.address          );
                        },
                        child: Container(
                          width: Dimens.screenWidth,
                          height: Dimens.fourty,
                          decoration: BoxDecoration(
                              color: ColorsValue.primaryColor,
                              borderRadius: BorderRadius.circular(Dimens.ten)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Edit Address',
                                style: Styles.white16,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GetBuilder<CheckoutController>(
                builder:(_con)=> Container(
                  // height: Dimens.screenWidth*0.9,
                  width: Dimens.screenWidth,
                  margin: EdgeInsets.symmetric(horizontal: Dimens.eight,vertical: Dimens.eight),
                  padding: EdgeInsets.symmetric(horizontal: Dimens.eight,vertical: Dimens.eight),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      const BoxShadow(
                        color: ColorsValue.primaryColor
                      )
                    ],
                    border: Border.all(width: 0.1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Preferred Delivery Date / Time',style: Styles.white16.copyWith(color: ColorsValue.primaryColor),),
                      Dimens.boxHeight20,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(5, (index) => InkWell(
                            onTap: (){
                              var date =
                                  '${_con.dayFor.format(DateTime.now().add(Duration(days: index))).substring(0,3)} '
                                  '${_con.dayFormatter.format(DateTime.now().add(Duration(days: index)))} '
                                  '${Text(_con.monthFormatter.format(DateTime.now().add(Duration(days: index))))}';
                              _con.updateIndexOfDate(index,date);
                            },
                            child: Container(
                              height: Dimens.seventy,
                              width: Dimens.fifty,
                              margin: EdgeInsets.symmetric(horizontal: Dimens.ten),
                              padding: EdgeInsets.all(Dimens.eight),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.3,),
                                  color: _con.indexSelected == index?ColorsValue.primaryColor:Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(_con.dayFor.format(DateTime.now().add(Duration(days: index))).substring(0,3) ,style: Styles.black12,),
                                    Text(_con.dayFormatter.format(DateTime.now().add(Duration(days: index))) ,style: Styles.black12,),
                                    Text(_con.monthFormatter.format(DateTime.now().add(Duration(days: index))) ,style: Styles.black12,),
                                  ],
                                ),
                              ),
                            ),
                          )),
                        ),
                      ),
                      Dimens.boxHeight20,
                      const Divider(color: Colors.black,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Afternoon 2 PM to 6 PM',style: Styles.black18,),
                          Checkbox(value: _con.timeIndex == 0,onChanged: (value)=>_con.updateIndexOfTime(0,'Afternoon 2 PM to 6 PM'),)
                        ],
                      ),
                      const Divider(height: 1,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Evening 7 PM to 9 PM',style: Styles.black18,),
                          Checkbox(value: _con.timeIndex == 1,onChanged: (value)=>_con.updateIndexOfTime(1,'Evening 7 PM to 9 PM'),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: Dimens.hundred * 1.55,
                width: Dimens.screenWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.sixTeen, vertical: Dimens.eight),
                margin: EdgeInsets.symmetric(horizontal: Dimens.eight,vertical: Dimens.eight),
                decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                          color: ColorsValue.primaryColor
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimens.ten),
                    border: Border.all(width: 0.1, color: Colors.grey)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: Styles.grey16,
                        ),
                        Price().showPrice(_controller.price)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: Styles.grey16,
                        ),
                        Price().showPrice(0)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Styles.boldBlack22,
                        ),
                        Price().showPrice(
                            _controller.price + _controller.deliveryCharge)
                      ],
                    ),
                    SizedBox(
                      height: Dimens.twenty,
                    ),
                    InkWell(
                      // onTap: (){
                      //   RoutesManagement.goToCheckout();
                      // },
                      child: Container(
                        width: Dimens.screenWidth,
                        height: Dimens.fifty,
                        decoration: BoxDecoration(
                            color: ColorsValue.primaryColor,
                            borderRadius: BorderRadius.circular(Dimens.ten)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Payment  ',
                              style: Styles.white16,
                            ),
                            const Icon(
                              Icons.login,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      );
}
