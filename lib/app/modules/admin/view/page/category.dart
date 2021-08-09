import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homeecart/app/data/network_model/category.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/global_widgets/cached_image.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:homeecart/app/utils/assets_constant.dart';

class CategoryAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Category',style: Styles.boldBlack16,),
      backgroundColor: ColorsValue.primaryColor,
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RoutesManagement.goToAddCategoryScreen();
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
          stream: FirebaseRepository().category(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Column(
                  children: List.generate(
                      4,
                      (index) => Padding(
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
            return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
              var model = Category.fromJson(document.data());
              return ListTile(
                leading: CircleAvatar(
                  child: CachedImage(imageUrl: model.imageUrl,),
                ),
                title: Text(model.name,style: Styles.black18,),
                trailing: IconButton(icon: const Icon(Icons.edit), onPressed: (){
                }),
              );
            }).toList());
          }));
}
