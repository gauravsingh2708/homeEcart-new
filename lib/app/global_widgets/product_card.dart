import 'package:flutter/material.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/global_widgets/price.dart';
import 'package:homeecart/app/theme/theme.dart';

Widget productCard({Product productInfo}) => Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: Dimens.screenWidth/2 - 48,
                decoration: BoxDecoration(
                    image: DecorationImage(
                    image: NetworkImage(productInfo.imageUrl)
                  )
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Text(productInfo.name,style: Styles.black18,),
          Expanded(child: Container(),),
          const SizedBox(height: 10,),
          Row(
            children: [
              Price().discountPrice(productInfo.discountPrice),
              const SizedBox(width: 20,),
              Price().price(productInfo.price),
            ],
          ),
          Price().saveAmount(productInfo.price, productInfo.discountPrice),
          const SizedBox(height: 10,),
          Container(
            height: 35,
            decoration: BoxDecoration(
              color: ColorsValue.primaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 0.4,color: ColorsValue.primaryColor)
            ),
            child: Center(child: Text('Add to Cart',style: Styles.boldBlack16,)),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    ),
  );
