import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/global_widgets/cached_image.dart';
import 'package:homeecart/app/modules/admin/controller/edit_product_controller.dart';
import 'package:homeecart/app/theme/theme.dart';

class EditProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Edit Product'),
      elevation: 2,
      backgroundColor: Colors.white,
    ),
    body: GetBuilder<EditProductController>(
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
                          :CachedImage(imageUrl: _controller.product.imageUrl,)
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
                            _controller.category.name ?? _controller.product.categoryName,
                            style: Styles.grey14,
                          ),
                        )),
                  ),
                  Dimens.boxHeight5,
                  TextFormField(
                    style: Styles.black18,
                    initialValue: _controller.product.name,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      labelText: 'Name',
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
                    initialValue: _controller.product.desc,
                    decoration: InputDecoration(
                      hintText: 'Desc',
                      labelText: 'Desc',
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
                    initialValue: '${_controller.product.purchasePrice}',
                    decoration: InputDecoration(
                      hintText: 'PurchasePrice',
                      labelText: 'PurchasePrice',
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
                    initialValue: '${_controller.product.price}',
                    decoration: InputDecoration(
                      hintText: 'Price',
                      labelText: 'Price',
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
                    initialValue: '${_controller.product.discountPrice}',
                    decoration: InputDecoration(
                      hintText: 'DiscountPrice',
                      labelText: 'DiscountPrice',
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
                    initialValue: '${_controller.product.limit}',
                    decoration: InputDecoration(
                      hintText: 'Limit',
                      labelText: 'Limit',
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
                    initialValue: '${_controller.product.count}',
                    decoration: InputDecoration(
                      hintText: 'Count',
                      labelText: 'Count',
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
                    initialValue: '${_controller.product.weight}',
                    decoration: InputDecoration(
                      hintText: 'Weight',
                      labelText: 'Weight',
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
                        _controller.updateProduct();
                      },
                      child: const Text('Update'))
                ],
              ),
            )),
      ),
    ),
  );
}
