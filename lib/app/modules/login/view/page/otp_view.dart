import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:homeecart/app/data/enum.dart';
import 'package:homeecart/app/modules/login/controller/login_controller.dart';
import 'package:homeecart/app/theme/theme.dart';

class OtpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetBuilder<LoginController>(
        builder: (_controller) => SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                title: Text(
                  'Login/SignUp',
                  style: Styles.black18,
                ),
                elevation: 2,
                backgroundColor: Colors.white,
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                      width: Dimens.screenWidth,
                      height: Dimens.screenHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Enter verification code',
                            style: Styles.boldBlack26.copyWith(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'We have send you a 6 digit verification code on',
                            style: Styles.grey14,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text('+91 ${_controller.number}'),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimens.eight,
                                  horizontal: Dimens.sixTeen),
                              child: PinCodeTextField(
                                appContext: context,
                                pastedTextStyle: TextStyle(
                                  color: Colors.green.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                                length: 6,
                                blinkWhenObscuring: true,
                                animationType: AnimationType.fade,
                                pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 50,
                                  borderWidth: 5,
                                  activeColor: Colors.white,
                                  activeFillColor: Colors.white,
                                  inactiveColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                ),
                                cursorColor: Colors.black,
                                animationDuration:
                                    const Duration(milliseconds: 300),
                                enableActiveFill: true,
                                // errorAnimationController: errorController,
                                keyboardType: TextInputType.number,
                                boxShadows: [
                                  const BoxShadow(
                                    offset: Offset(0, 1),
                                    color: Colors.black12,
                                    blurRadius: 10,
                                  )
                                ],
                                onCompleted: (v) {
                                  print('Completed');
                                },
                                onChanged: (value) {
                                  print(value);
                                  _controller.onPressedLogin(value);
                                },
                                beforeTextPaste: (text) {
                                  print('Allowing to paste $text');
                                  return true;
                                },
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          if (!_controller.showCounter)
                            Text(
                              'Time elapsed',
                              style: Styles.grey16
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          if (!_controller.showCounter)
                            const SizedBox(
                              height: 15,
                            ),
                          if (!_controller.showCounter)
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1.5, color: ColorsValue.primaryColor),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Resend Code',
                                  style:
                                      Styles.grey16.copyWith(color: Colors.black87),
                                ),
                              ),
                            ),
                          _controller.showCounter
                              ? CountdownTimer(
                                  endTime: DateTime.now().millisecondsSinceEpoch +
                                      1000 * 30,
                            onEnd: _controller.updateCounterView,
                                )
                              : Container(),
                          const SizedBox(
                            height: 55,
                          ),
                          InkWell(
                            onTap: () {
                              _controller.loginWithOtp();
                            },
                            hoverColor: Colors.blueGrey,
                            child: Container(
                              height: 56,
                              width: 350,
                              decoration: BoxDecoration(
                                color: _controller.hasError
                                    ? Colors.black
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text('Login', style: Styles.white16)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if(_controller.pageStatus == PageStatus.loading)
                      Container(
                        height: Dimens.screenHeight,
                        width:Dimens.screenWidth,
                        color: Colors.blueGrey.withOpacity(0.5),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ],
                ),
              )),
        ),
      );
}
