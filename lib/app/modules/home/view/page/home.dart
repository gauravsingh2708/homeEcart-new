import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/service/common_service.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/global_widgets/loading_widget.dart';
import 'package:homeecart/app/global_widgets/post.dart';
import 'package:homeecart/app/modules/home/view/local_widget/category_grid_view.dart';
import 'package:homeecart/app/modules/home/view/local_widget/poster.dart';
import 'package:homeecart/app/modules/home/view/local_widget/slider.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/utils/utility.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:homeecart/app/modules/home/controller/home_controller.dart';
import 'package:homeecart/app/theme/theme.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SafeArea(child: GetBuilder<HomeController>(
          builder: (_controller) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
        });
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            title: InkWell(
              onTap: (){
                if(_controller.controller.userModel.isMerchant){
                  RoutesManagement.goToAdminScreen();
                }
                else{
                  Utility.printDLog('You are not merchant');
                }
              },
              child: Text(
                'HomeEcart',
                style:
                    Styles.boldBlack22.copyWith(color: ColorsValue.primaryColor),
              ),
            ),
            actions: [
              Stack(children: [
                IconButton(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      size: Dimens.twentyEight,
                    ),
                    onPressed: () {
                      RoutesManagement.goToCart();
                    }),
                Positioned(
                    top: 10,
                    left: 19,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                          child: GetBuilder<UserService>(
                            builder:(_controller)=> Text(
                        '${_controller.cartCount}',
                        style: Styles.boldBlack16.copyWith(fontSize: 10),
                      ),
                          )),
                    )),
              ]),
              Dimens.boxWidth20
            ],
          ),
          backgroundColor: Colors.grey.withOpacity(0.1),
          body: SmartRefresher(
            controller: _controller.homeRefreshController,
            // scrollController: _controller.scrollController,
            onRefresh: () {
              _controller.refreshHomePage();
            },
            child: ListView(
              // controller: _controller.scrollController,
              children: [
                GetBuilder<CommonService>(
                  builder: (_con) => _con.locationData.addressLine1 == null
                      ? const SizedBox()
                      : InkWell(
                          onTap: () {
                            _con.showLocationBottomSheet();
                          },
                          child: Container(
                            height: Dimens.fourty,
                            margin: EdgeInsets.symmetric(vertical: Dimens.one),
                            width: Dimens.screenWidth,
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 16,
                                ),
                                Icon(
                                  Icons.gps_fixed,
                                  size: Dimens.twenty,
                                  color: ColorsValue.primaryColor,
                                ),
                                Text(
                                  '  ${_con.locationData.placeName}, ${_con.locationData.city}, ${_con.locationData.postalCode}',
                                  style: Styles.black12.copyWith(
                                      fontWeight: FontWeight.w600, height: 1.8),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: Dimens.fourty,
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                _controller.sliderItem.isNotEmpty
                    ? SliderCarousel(
                        sliderItem: _controller.sliderItem,
                      )
                    : loadingWidget(
                        height: 200,
                        width: Dimens.screenWidth,
                      ),
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  width: Dimens.screenWidth,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: const DecorationImage(
                              image: AssetImage('assets/img/bar.png'),
                              fit: BoxFit.cover,
                              // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                            )),
                      ),
                      Text(
                        '  1,204 orders this year in Dehri',
                        style: Styles.black12
                            .copyWith(fontWeight: FontWeight.w600, height: 1.8),
                      )
                    ],
                  ),
                ),
                _controller.categoryItem.isNotEmpty
                    ? CategoryGridView(
                        categoryItem: _controller.categoryItem,
                      )
                    : LoadingGridView(),
                _controller.bannerModel.imageUrl == null
                    ? loadingWidget(
                        height: 200,
                        width: Dimens.screenWidth,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      )
                    : Poster(
                        imageUrl: _controller.bannerModel.imageUrl,
                      ),
                _controller.productListPost.isNotEmpty
                    ? Post(
                        productPost: _controller.productPost,
                        productList: _controller.productListPost,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      }));
}
