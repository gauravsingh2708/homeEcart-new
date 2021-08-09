import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/modules/add_details/controller/add_product_controller.dart';
import 'package:homeecart/app/theme/theme.dart';

class AddProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
          elevation: 2,
          backgroundColor: Colors.white,
        ),
        body: GetBuilder<AddProductController>(
          builder: (_controller) => SingleChildScrollView(
            child: Form(
                key: _controller.formKeyPro,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          _controller.selectImageForProduct();
                        },
                        child: Container(
                          width: Dimens.hundred * 1.5,
                          height: Dimens.hundred * 1.5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: _controller.proFile != null
                              ? Image.file(
                                  _controller.proFile,
                                  fit: BoxFit.cover,
                                )
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
                      Dimens.boxHeight5,
                      InkWell(
                        onTap: () {
                          _controller.showBottomSheet();
                        },
                        child: Container(
                            width: Dimens.screenWidth,
                            height: Dimens.seventy,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                _controller.category.name ?? 'Category',
                                style: Styles.grey14,
                              ),
                            )),
                      ),
                      Dimens.boxHeight5,
                      TextFormField(
                        style: Styles.black18,
                        decoration: InputDecoration(
                          hintText: 'Name',
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
                        onSaved: (value) => _controller.product.name = value,
                      ),
                      Dimens.boxHeight5,
                      TextFormField(
                        style: Styles.black18,
                        decoration: InputDecoration(
                          hintText: 'Desc',
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
                        onSaved: (value) => _controller.product.desc = value,
                      ),
                      Dimens.boxHeight5,
                      TextFormField(
                        style: Styles.black18,
                        decoration: InputDecoration(
                          hintText: 'PurchasePrice',
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
                        onSaved: (value) => _controller.product.purchasePrice =
                            double.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      Dimens.boxHeight5,
                      TextFormField(
                        style: Styles.black18,
                        decoration: InputDecoration(
                          hintText: 'Price',
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
                        onSaved: (value) =>
                            _controller.product.price = double.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      Dimens.boxHeight5,
                      TextFormField(
                        style: Styles.black18,
                        decoration: InputDecoration(
                          hintText: 'DiscountPrice',
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
                        onSaved: (value) => _controller.product.discountPrice =
                            double.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      Dimens.boxHeight5,
                      TextFormField(
                        style: Styles.black18,
                        decoration: InputDecoration(
                          hintText: 'Limit',
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
                        onSaved: (value) =>
                            _controller.product.limit = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      Dimens.boxHeight5,
                      TextFormField(
                        style: Styles.black18,
                        decoration: InputDecoration(
                          hintText: 'Count',
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
                        onSaved: (value) =>
                            _controller.product.count = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      Dimens.boxHeight5,
                      TextFormField(
                        style: Styles.black18,
                        decoration: InputDecoration(
                          hintText: 'Weight',
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
                        onSaved: (value) =>
                            _controller.product.weight = double.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _controller.addProduct();
                          },
                          child: const Text('Submit'))
                    ],
                  ),
                )),
          ),
        ),
      );
}
