import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/enum.dart';
import 'package:homeecart/app/modules/login/controller/login_controller.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homeecart/app/theme/theme.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    // body: Container(
    //   height: Dimens.screenHeight,
    //   width: Dimens.screenWidth,
    //   color: Colors.black,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Container(
    //             height: 60,
    //             width: 60,
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(5)),
    //             child: const Center(
    //               child: Icon(
    //                 Icons.store,
    //                 size: 50,
    //                 color: Colors.black,
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             width: 20,
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 'HomeEcart',
    //                 style: GoogleFonts.ptSans(
    //                     fontSize: 36, color: Colors.white),
    //               ),
    //               Text(
    //                 'Price you can Trust',
    //                 style: GoogleFonts.ptSans(
    //                     color: Colors.white, fontSize: 15),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ],
    //   ),
    // ),
    body: SafeArea(
        child: GetBuilder<LoginController>(builder: (_controller)=>Stack(
          children: [
            Container(
              height: Dimens.screenHeight,
              width: Dimens.screenWidth,
              decoration: const BoxDecoration(
                  color: Colors.black26,
                  image: DecorationImage(
                    image: AssetImage('assets/img/login_background.jpeg'),
                    fit: BoxFit.fill,
                    // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                  )
              ),
            ),
            SizedBox(
              height: Dimens.screenHeight,
              width: Dimens.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            // image: const DecorationImage(
                            //   image: AssetImage('assets/img/icon.png'),
                            //   fit: BoxFit.fill,
                            //   // colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken)
                            // )
                        ),
                        child:Center(child: Text('HE',style: Styles.boldAppColor36.copyWith(color: Colors.white),))
                      ),
                      const SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Home',style: GoogleFonts.ptSans(fontSize: 36,color: Colors.black,fontWeight: FontWeight.w700,height:1.2),),
                          Text('Ecart',style: GoogleFonts.ptSans(fontSize: 25,color: Colors.black,height:0.9),),

                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text('Price Your Can Trust',style: Styles.black18.copyWith(fontWeight: FontWeight.w600),),
                  Text('Quick-Affordable-Trusted',style: Styles.grey14.copyWith(fontSize: 10),),
                  const SizedBox(height: 20,),
                  Container(
                    height: 45,
                    width: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.5,color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10,),
                        Flag('in',height: 20,width: 25,),
                        const SizedBox(width: 5,),
                        const Text('+91',style: TextStyle(color: Colors.black,fontSize: 15),),
                        const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: VerticalDivider(width: 2,color: Colors.grey,),
                        ),
                        const SizedBox(width: 15,),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            style: Styles.black18,
                            cursorColor: Colors.black,
                            onChanged: (value) => _controller.enableLoginButton(value),
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: 'Mobile Number',
                              border: InputBorder.none,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  _controller.showLoginButton?InkWell(
                    onTap: ()async{
                      await _controller.loginWithPhoneNumber(_controller.number);
                    },
                    hoverColor: Colors.blueGrey,
                    child: Container(
                      height: 56,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text('Login/SignUp',
                            style: GoogleFonts.ptSans(color: Colors.white, fontWeight: FontWeight.normal,)
                        ),
                      ),
                    ),
                  ):Container()
                ],
              ),
            ),
            Positioned(
                bottom: Dimens.thirty,
                right: Dimens.twenty,
                child:InkWell(
                  onTap: (){
                    RoutesManagement.goToHome();
                  },
                  child: Container(
                    width: Dimens.seventy,
                    height: Dimens.fourty,
                    decoration: BoxDecoration(
                        color: Colors.white,//greyColor.withOpacity(0.7),
                        border: Border.all(color: Colors.black,width: 1),
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(child:Text('Skip',style: Styles.black18,)),
                  ),
                )
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
        ))
    ),
  );
}
