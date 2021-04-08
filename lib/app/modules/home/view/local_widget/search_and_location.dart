import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/modules/home/controller/home_controller.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class SearchAndLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder:(_controller)=> Container(
      width: Dimens.screenWidth,
      height: 110,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_pin,
                  color: Colors.white,
                  size: 18,
                ),
                SimpleTooltip(
                  tooltipTap: () {
                    print('Tooltip tap');
                  },
                  backgroundColor: ColorsValue.primaryColor,
                  borderColor: Colors.white,
                  animationDuration: const Duration(seconds: 3),
                  show: _controller.showToolTips,
                  tooltipDirection: TooltipDirection.down,
                  content: const Text(
                    'Some text example!!!!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  child: Text(
                    '   Bannerghatta Main Rd, Chinnayanp..',
                    style: Styles.white14,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                  size: 25,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              RoutesManagement.goToSearchScreen();
            },
            child: Container(
                height: 47,
                width: Dimens.screenWidth,
                margin: EdgeInsets.symmetric(horizontal: Dimens.ten),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    Text(
                      ' Search for services and package',
                      style: Styles.grey14
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
          )
        ],
      ),
    ),
  );
}
