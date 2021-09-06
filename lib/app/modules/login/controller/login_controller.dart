import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/enum.dart';
import 'package:homeecart/app/data/network_model/user.dart';
import 'package:homeecart/app/data/repository/firebase_repository.dart';
import 'package:homeecart/app/data/service/common_service.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/modules/login/view/page/otp_view.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/utils/utility.dart';

class LoginController extends GetxController {
  ///Firebase Auth part
  ///Instance of Firebase Auth
  FirebaseAuth auth = FirebaseAuth.instance;

  String localVerificationId = '';

  final CommonService _con = Get.find();

  ///Function is used to login user with phone number and otp
  Future<void> loginWithPhoneNumber(String phoneNumber) async {
    updatePageStatus(PageStatus.loading);
    try {
      await auth
          .verifyPhoneNumber(
              phoneNumber: '+91$phoneNumber',
              timeout: const Duration(seconds: 60),
              verificationCompleted: (AuthCredential authCredential) {
                auth.signInWithCredential(authCredential).then((result) {
                  RoutesManagement.goToHome();
                }).catchError((String e) {
                  print('Inside verification error');
                  Utility.printELog(e.toString());
                });
              },
              verificationFailed: (authException) {
                Utility.printELog(authException.message);
              },
              codeSent: (String verificationId, [int forceResendingToken]) {
                localVerificationId = verificationId;
              },
              codeAutoRetrievalTimeout: (String verificationId) {
                localVerificationId = verificationId;
              }
              )
          .whenComplete(() {
        updatePageStatus(PageStatus.idle);
        RoutesManagement.goToOtpScreen();
      });
    } catch (onError) {
      updatePageStatus(PageStatus.idle);
      Utility.printELog(onError.toString());
    }
  }

  UserCredential userCredential;
  ConfirmationResult confirmationResult;

  // Future<void> phoneSignInInWeb(String phoneNumber) async {
  //   updatePageStatus(PageStatus.loading);
  //   try{
  //     confirmationResult = await auth.signInWithPhoneNumber('+91$phoneNumber',).whenComplete(() {
  //       updatePageStatus(PageStatus.idle);
  //       RoutesManagement.goToOtpScreen();
  //     });
  //
  //   }
  //   catch(onError){
  //     updatePageStatus(PageStatus.idle);
  //     Utility.printELog(onError.toString());
  //   }
  // }
  //
  // void loginWithOtpInWeb() async {
  //   updatePageStatus(PageStatus.loading);
  //   await confirmationResult.confirm(pin).then((value) async {
  //     await auth.signInWithCredential(value.credential).then((value) async {
  //       var user = UserModel()
  //         ..phone = number
  //         ..uid = value.user.uid
  //         ..lat = _con.locationData.latitude
  //         ..long = _con.locationData.longitude
  //         ..address = _con.locationData.addressLine1
  //         ..name = ' '
  //         ..email = ' '
  //         ..isMerchant = false;
  //       await checkAndCreateUser(user);
  //
  //     });
  //   });
  //
  // }

  void loginWithOtp() async {
    updatePageStatus(PageStatus.loading);
    final credential = PhoneAuthProvider.credential(
        verificationId: localVerificationId,
        smsCode: pin);
    try{
      await auth.signInWithCredential(credential).then((value) async {
        await checkAndCreateUser(value.user.uid,number);
      });
    }
    on FirebaseAuthException catch(e){
      updatePageStatus(PageStatus.idle);
      Utility.showError('${e.message}');
    }

  }

  Future<void> checkAndCreateUser(String uid, String mobile) async {
    await FirebaseRepository().checkProfileCreate(uid).then((value) async {
      Utility.printDLog('User created $value');
      if (value) {
        Get.put(UserService(), permanent: true,);
        RoutesManagement.goToHome();
      } else {
        RoutesManagement.goToEditAddressScreen(mobile, uid);
      }
    });
  }

  /// Flag to show login button
  bool showLoginButton = false;

  /// The current status of the page.
  PageStatus pageStatus = PageStatus.idle;

  /// Variable to store mobile number
  String number = '';

  /// Function to update the [showLoginButton] flag
  void enableLoginButton(String value) {
    if (value.length == 10) {
      number = value;
      showLoginButton = true;
    } else {
      showLoginButton = false;
    }
    update();
  }

  /// From Here all Element in for [OtpView]

  TextEditingController textEditingController = TextEditingController();

  bool showCounter = true;
  bool hasError = false;
  String pin = '';
  final formKey = GlobalKey<FormState>();

  void onPressedLogin(String value) {
    if (value.length == 6) {
      hasError = true;
      pin = value;
    }
    update();
  }

  void updateCounterView() {
    showCounter = !showCounter;
    update();
  }

  /// Update the page status
  /// [pageStatus] : the new page status.
  void updatePageStatus(PageStatus pageStatus) {
    this.pageStatus = pageStatus;
    update();
  }
}
