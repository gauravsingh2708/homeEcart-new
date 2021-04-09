import 'package:flutter/material.dart';
import 'package:homeecart/app/data/network_model/product.dart';
import 'package:homeecart/app/theme/theme.dart';

class ProductPost extends StatelessWidget {

  ProductPost({this.productList});
  final List<Product> productList;
  @override
  Widget build(BuildContext context) => Container(
    height: Dimens.screenHeight - 180,
    width: Dimens.screenWidth,
    margin: const EdgeInsets.only(bottom: 13),
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Best offers',
            style: Styles.blackBold18.copyWith(fontSize: 20),
          ),
          Text(
            'Hygienic & single-use products| low-contact services',
            style: Styles.grey14,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: Dimens.screenHeight - 360,
            width: Dimens.screenWidth,
            margin: const EdgeInsets.only(bottom: 13),
            color: Colors.white,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
                mainAxisSpacing: 1,
                // mainAxisSpacing: 0.5,
                children: List.generate(4, (index)=> SizedBox(
                  height: (Dimens.screenHeight - 200) / 3 + 10,
                  width: (Dimens.screenWidth) / 2 - 24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/img/bestOffers1.png'),
                              fit: BoxFit.cover,
                              // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Salon for Men',
                        style: Styles.blackBold15.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 13),
                      ),
                      Text(
                        'Flat 100 off',
                        style: Styles.grey14,
                      )
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
                  'View All Services',
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
