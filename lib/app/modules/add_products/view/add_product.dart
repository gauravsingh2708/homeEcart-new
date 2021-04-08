import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/modules/add_products/controller/add_product_controller.dart';

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
                key: _controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Category Id'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) =>
                            _controller.product.categoryId = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Category Name'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) =>
                            _controller.product.categoryName = value,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Product Name'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) => _controller.product.name = value,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Product Id'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) =>
                            _controller.product.id = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Product PurchasePrice'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) => _controller.product.purchasePrice =
                            double.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Product Price'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) =>
                            _controller.product.price = double.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Product DiscountPrice'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) => _controller.product.discountPrice =
                            double.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Product Limit'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) =>
                            _controller.product.limit = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Product count'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) =>
                            _controller.product.count = int.parse(value),
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(hintText: 'Product ImageUrl'),
                        validator: (value) =>
                            value.isNotEmpty ? null : 'Field required',
                        onSaved: (value) =>
                            _controller.product.imageUrl = value,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            _controller.onSubmit();
                          }, child: const Text('Submit'))
                    ],
                  ),
                )),
          ),
        ),
      );
}
