import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/global_widgets/loading_widget.dart';
import 'package:homeecart/app/global_widgets/post.dart';
import 'package:homeecart/app/modules/home/view/local_widget/category_grid_view.dart';
import 'package:homeecart/app/modules/home/view/local_widget/poster.dart';
import 'package:homeecart/app/modules/home/view/local_widget/search_and_location.dart';
import 'package:homeecart/app/modules/home/view/local_widget/slider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:homeecart/app/modules/home/controller/home_controller.dart';
import 'package:homeecart/app/theme/theme.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      SafeArea(child: GetBuilder<HomeController>(builder: (_controller) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // if (_controller.scrollController.position.minScrollExtent !=
          //     _controller.scrollController.position.pixels) {
          //   _controller.hideToolTips();
          // }
        });
        return Scaffold(
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
                SearchAndLocation(),
                _controller.sliderItem.isNotEmpty
                    ? SliderCarousel(
                        sliderItem: _controller.sliderItem,
                      )
                    : loadingWidget(height: 200, width: Dimens.screenWidth,),
               Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 16),
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
                    ?loadingWidget(height: 200, width: Dimens.screenWidth,padding:const EdgeInsets.symmetric(vertical: 16), )
                    :Poster(imageUrl: _controller.bannerModel.imageUrl,),
                _controller.productListPost.isNotEmpty
                    ?Post(productPost: _controller.productPost,productList: _controller.productListPost,)
                    :const SizedBox(),
              ],
            ),
          ),
        );
      }));
}
