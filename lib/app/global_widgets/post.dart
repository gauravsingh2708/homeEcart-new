import 'package:flutter/material.dart';
import 'package:homeecart/app/data/network_model/post.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/global_widgets/price.dart';
import 'package:homeecart/app/theme/theme.dart';

class Post extends StatelessWidget {

 Post({this.productList,this.productPost});
  final List<Product> productList;
  final ProductPost productPost;
  @override
  Widget build(BuildContext context) => Container(
    height: Dimens.screenHeight - 180,
    width: Dimens.screenWidth,
    margin: const EdgeInsets.only(bottom: 13),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 20,
          // ),
          Text(productPost.title,
            style: Styles.blackBold18.copyWith(fontSize: 20),
          ),
          Text(
            productPost.subTitle,
            style: Styles.grey14,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: Dimens.screenHeight - 340,
            width: Dimens.screenWidth,
            margin: const EdgeInsets.only(bottom: 13),
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 1,
                childAspectRatio: 1,
                mainAxisSpacing: 1,
                // mainAxisSpacing: 0.5,
                children: List.generate(productList.length, (index)=> Container(
                  height: (Dimens.screenHeight - 200) / 3 + 10,
                  width: (Dimens.screenWidth) / 2 - 24,
                  color: ColorsValue.greyColor.withOpacity(0.1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image:  DecorationImage(
                              image: NetworkImage(productList[index].imageUrl),
                              fit: BoxFit.contain,
                              // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(' ${productList[index].name}',style: Styles.black12,),
                      Row(
                        children: [
                          Text(' ₹',style: Styles.black18),
                          Text(
                            '${productList[index].discountPrice}',
                            style: Styles.black18.copyWith(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('M.R.P ₹ ${productList[index].price}',
                              style: Styles.grey14.copyWith(decoration: TextDecoration.lineThrough,fontSize: 12))
                        ],
                      ),
                    ],
                  ),
                ),)
            ),
          ),
          InkWell(
            onTap: () {},
            hoverColor: Colors.grey,
            child: Container(
              height: 48,
              width: Dimens.screenWidth,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      width: 0.5,
                      color: ColorsValue.primaryColor),
                  color:
                  ColorsValue.primaryColor.withOpacity(0.1)),
              child: Center(
                child: Text(
                  'View All Products',
                  style:
                  Styles.grey14.copyWith(color: Colors.blue),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
