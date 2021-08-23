import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/theme/theme.dart';
import 'package:homeecart/app/utils/utility.dart';
import 'package:intl/intl.dart';

class CheckoutController extends GetxController {
  final currentDate = DateTime.now();
  final dayFormatter = DateFormat('d');
  final monthFormatter = DateFormat('MMM');
  final dayFor = DateFormat('EEEE');

  final dates = <Widget>[];

  int indexSelected = 0;
  int timeIndex = 0;

  String date;
  String time;
  String editedAddress;

  void setDate(String value) {
    date = value;
    update();
  }

  void setTime(String value) {
    time = value;
    update();
  }

  void dateAndTime() {
    for (var i = 0; i < 5; i++) {
      final date = currentDate.add(Duration(days: i));
      dates.add(Container(
        height: Dimens.hundred,
        width: Dimens.sixty,
        margin: EdgeInsets.symmetric(horizontal: Dimens.ten),
        padding: EdgeInsets.all(Dimens.sixTeen),
        decoration: BoxDecoration(
            border: Border.all(
              width: 0.3,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            children: [
              Text(
                dayFormatter.format(date),
                style: Styles.black12,
              ),
              Text(
                monthFormatter.format(date),
                style: Styles.black12,
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void onInit() {
    dateAndTime();
    super.onInit();
  }

  void updateIndexOfDate(int index, String value) {
    indexSelected = index;
    date = value;
    update();
  }

  void updateIndexOfTime(int index, String value) {
    timeIndex = index;
    time = value;
    update();
  }

  void editAddress(String address) {
    Get.dialog<dynamic>(Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 100),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsValue.primaryColor,
          title: Text(
            'Edit Address',
            style: Styles.white16,
          ),
        ),
        body: Container(
          // height: Dimens.hundred*2,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: Dimens.screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                style: Styles.black18,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
                initialValue: address,
                onChanged: (value) {
                  editedAddress = value;
                  update();
                },
                maxLines: 3,
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  await FirebaseRepository()
                      .updateAddress(editedAddress)
                      .whenComplete(Utility.closeDialog);
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  height: Dimens.fourty,
                  width: Dimens.screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsValue.primaryColor,
                  ),
                  child: Center(
                      child: Text(
                    'Update',
                    style: Styles.white16,
                  )),
                ),
              ),
              Dimens.boxHeight30
            ],
          ),
        ),
      ),
    ));
  }

  void checkout() {}
}
