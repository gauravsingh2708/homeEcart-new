import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homeecart/app/data/network_model/slider.dart';
import 'package:homeecart/app/theme/theme.dart';

class SliderCarousel extends StatelessWidget {
  SliderCarousel({this.sliderItem});
  final List<SliderModel> sliderItem;
  @override
  Widget build(BuildContext context) => Container(
    height: 200,
    width: Dimens.screenWidth,
    color: Colors.white,
    child: CarouselSlider(
      items: List.generate(sliderItem.length, (index) => Container(
        height: 200,
        width: Dimens.screenWidth,
        decoration: BoxDecoration(
            image:  DecorationImage(
              image: NetworkImage(sliderItem[index].imageUrl),
              fit: BoxFit.cover,
              // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
            )),
      ),),
      options: CarouselOptions(
        height: 200,
        aspectRatio: 1,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 8),
        autoPlayAnimationDuration:
        const Duration(milliseconds: 2000),
        //autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        //onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
    ),
  );
}
