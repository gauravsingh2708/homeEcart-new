import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController{

  final currentDate = DateTime.now();
  final dayFormatter = DateFormat('d');
  final monthFormatter = DateFormat('MMM');
  final dayFor = DateFormat('EEEE');

  final dates = <Widget>[];

  int indexSelected = 0;
  int timeIndex = 0;


  String date;
  String time;


  void setDate(String value){
    date = value;
    update();
  }

  void setTime(String value){
    time = value;
    update();
  }

  void dateAndTime(){
    for (var i = 0; i < 5; i++) {
      final date = currentDate.add(Duration(days: i));
      dates.add(Container(
        height: Dimens.hundred,
        width: Dimens.sixty,
        margin: EdgeInsets.symmetric(horizontal: Dimens.ten),
        padding: EdgeInsets.all(Dimens.sixTeen),
        decoration: BoxDecoration(
            border: Border.all(width: 0.3,),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Column(
            children: [
              Text(dayFormatter.format(date),style: Styles.black12,),
              Text(monthFormatter.format(date),style: Styles.black12,),
            ],
          ),
        ),
      )
      );
    }
  }

  @override
  void onInit() {
    dateAndTime();
    super.onInit();
  }

  void updateIndexOfDate(int index, String value){
    indexSelected = index;
    date = value;
    update();
  }

  void updateIndexOfTime(int index, String value){
    timeIndex = index;
    time = value;
    update();
  }

  void checkout(){

  }
}