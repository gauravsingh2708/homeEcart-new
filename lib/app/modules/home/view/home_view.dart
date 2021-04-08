import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/modules/home/controller/home_controller.dart';
import 'package:homeecart/app/modules/home/view/local_widget/bottom_navigation.dart';
import 'package:homeecart/app/modules/home/view/page/bookings.dart';
import 'package:homeecart/app/modules/home/view/page/home.dart';
import 'package:homeecart/app/modules/home/view/page/profile.dart';
import 'package:homeecart/app/modules/home/view/page/reward.dart';
import 'package:homeecart/app/modules/home/view/page/sc_safe.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(builder: (_controller)=>SafeArea(
    child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigation(),
      body: IndexedStack(
        index: _controller.currentTab,
        children: [
          Home(),
          Bookings(),
          SCSafe(),
          Rewards(),
          Profile()
        ],
      ),
    ),
  ));
}
