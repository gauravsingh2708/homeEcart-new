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
                    : Container(),
                _controller.bannerModel.imageUrl == null
                    ?loadingWidget(height: 200, width: Dimens.screenWidth,padding:const EdgeInsets.symmetric(vertical: 16), )
                    :Poster(imageUrl: _controller.bannerModel.imageUrl,),
                ProductPost(),
                Container(
                  height: Dimens.screenHeight - 150,
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
                        Row(
                          children: [
                            SizedBox(
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
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
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
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/bestOffers2.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Salon at Home',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  // Text('Flat 100 off',style: Styles.grey14,)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
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
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/bestOffers3.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Massage Therapy for Men',
                                    style: Styles.blackBold15
                                        .copyWith(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13)
                                        .copyWith(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13),
                                  ),
                                  Text(
                                    'Starts at 499',
                                    style: Styles.grey14,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
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
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/bestOffers4.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Essential Home Cleaning',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  // Text('Flat 100 off',style: Styles.grey14,)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                ),
                Container(
                  height: Dimens.screenHeight - 150,
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
                          'Appliances',
                          style: Styles.blackBold18.copyWith(fontSize: 20),
                        ),
                        Text(
                          'Servicing, Repair, Installation & UnInstallation',
                          style: Styles.grey14,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
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
                                              'assets/img/appliances1.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'AC Service',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  Text(
                                    'Up to 30% off',
                                    style: Styles.grey14,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
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
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/appliances2.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Video Consultation',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  // Text('Flat 100 off',style: Styles.grey14,)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
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
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/appliances3.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'RO Service & Repair',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  // Text('Flat 100 off',style: Styles.grey14,)
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
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
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/appliances4.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Washing Machine Repair',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  // Text('Flat 100 off',style: Styles.grey14,)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          hoverColor: Colors.grey,
                          child: Container(
                            height: 50,
                            width: Dimens.screenWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 0.5, color: Colors.blue),
                                color: Colors.lightBlue.withOpacity(0.1)),
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
                ),
                Container(
                  height: Dimens.screenHeight - 150,
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
                          'Cleaning & Pest Control',
                          style: Styles.blackBold18.copyWith(fontSize: 20),
                        ),
                        // Text('Hygienic & single-use products| low-contact services',style: Styles.grey14,),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
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
                                              'assets/img/cleaning1.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Essential Home Cleaning',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  // Text('Flat 100 off',style: Styles.grey14,)
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
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
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/cleaning2.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Pest Control',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  // Text('Flat 100 off',style: Styles.grey14,)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
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
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5),
                                        image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/img/cleaning3.png'),
                                          fit: BoxFit.cover,
                                          // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                                        )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Car Cleaning',
                                    style: Styles.blackBold15.copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13),
                                  ),
                                  // Text('Flat 100 off',style: Styles.grey14,)
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            // SizedBox(
                            //   height: (Dimens.screenHeight-200)/3+10,
                            //   width: (Dimens.screenWidth)/2-24,
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.start,
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Container(
                            //         height: 120,
                            //         width: double.infinity,
                            //         decoration: BoxDecoration(
                            //             color: Colors.grey,
                            //             borderRadius: BorderRadius.circular(5),
                            //             image: const DecorationImage(
                            //               image: AssetImage('assets/img/cleaning1.png'),
                            //               fit: BoxFit.cover,
                            //               // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                            //             )
                            //         ),
                            //       ),
                            //       const SizedBox(height: 10,),
                            //       Text('Salon for Men',style: Styles.blackBold15.copyWith(fontWeight: FontWeight.w300,fontSize: 13),),
                            //       Text('Flat 100 off',style: Styles.grey14,)
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          hoverColor: Colors.grey,
                          child: Container(
                            height: 50,
                            width: Dimens.screenWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 0.5, color: Colors.blue),
                                color: Colors.lightBlue.withOpacity(0.1)),
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
                )
              ],
            ),
          ),
        );
      }));
}
