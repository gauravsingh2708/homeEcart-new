import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/global_widgets/cached_image.dart';
import 'package:homeecart/app/modules/add_details/controller/add_product_controller.dart';
import 'package:homeecart/app/modules/admin/controller/edit_details_controller.dart';
import 'package:homeecart/app/theme/theme.dart';

class EditDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: GetBuilder<EditDetailsController>(
        builder: (_con) => Form(
          key: _con.formKeyCat,
          child: Padding(
            padding: EdgeInsets.all(Dimens.sixTeen),
            child:Column(
                children: [
                  InkWell(
                    onTap: () {
                      _con.selectCategoryImage();
                    },
                    child: Container(
                      width: Dimens.hundred * 1.5,
                      height: Dimens.hundred * 1.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: _con.category != null
                          ? CachedImage(imageUrl: _con.category.imageUrl,)
                          : Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add,
                            size: Dimens.fifty,
                            color: Colors.grey,
                          ),
                          Text(
                            'Add Photo',
                            style: Styles.grey16,
                          )
                        ],
                      ),
                    ),
                  ),
                  Dimens.boxHeight15,
                  TextFormField(
                    style: Styles.black18,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                    ),
                    validator: (value) =>
                    value.isNotEmpty ? null : 'Field required',
                    onSaved: (value) => _con.category.name = value,
                    keyboardType: TextInputType.name,
                  ),
                  Dimens.boxHeight15,
                  InkWell(
                    onTap: (){
                      _con.updateCategory();
                    },
                    child: Container(
                      width: Dimens.screenWidth,
                      height: Dimens.sixty,
                      decoration: BoxDecoration(
                          color: ColorsValue.primaryColor,
                          border: Border.all(color: Colors.black, width: 0.3),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                            'Add Category',
                            style: Styles.boldWhite16,
                          )),
                    ),
                  ),
                ],
              ),
          ),
        ),
      ),
    ),
  );
}
