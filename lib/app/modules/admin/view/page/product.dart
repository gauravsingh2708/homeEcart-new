import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/global_widgets/cached_image.dart';
import 'package:homeecart/app/modules/admin/controller/admin_controller.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:homeecart/app/utils/assets_constant.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Product',style: Styles.black18,),
    ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            RoutesManagement.goToAddProductScreen();
          },
          child: const Icon(Icons.add),
        ),
    body: GetBuilder<AdminController>(
      builder:(_controller)=> StreamBuilder(
          stream: FirebaseRepository().product(_controller.marketModel.uid),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                  children: List.generate(
                      4, (index) => Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: Dimens.screenWidth,
                          height: Dimens.fifty,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetConstants.loading,
                                  fit: BoxFit.cover)),
                        ),
                      )));
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    var model = Product.fromJson(document.data());
                    return Container(
                      height: Dimens.hundred*2,
                      width:  Dimens.screenWidth,
                      margin: EdgeInsets.symmetric(vertical: Dimens.ten),
                      decoration: BoxDecoration(
                        border: Border.all(width: Dimens.one*0.5),
                        borderRadius: BorderRadius.circular(Dimens.twenty)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: Dimens.hundred*1.5,
                                width: Dimens.hundred*1.5,
                                child: CachedImage(imageUrl: model.imageUrl,),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(model.name),
                                  Text(model.categoryName),
                                  Text('Purchase Rate: ${model.purchasePrice}'),
                                  Text('Price: ${model.price}'),
                                  Text('Discount Rate: ${model.discountPrice}'),
                                  Text('Count ${model.count}'),
                                  Text('limit: ${model.limit}'),
                                  Text('Weight ${model.weight}')

                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList()),
            );
          }),
    )
  );
}
