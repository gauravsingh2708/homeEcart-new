import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/modules/home/view/local_widget/profile_tile.dart';
import 'package:homeecart/app/routes/route_mangement.dart';
import 'package:homeecart/app/theme/theme.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        body: GetBuilder<UserService>(
            builder: (_controller) => ListView(
                  children: [
                    Container(
                      height: 82,
                      width: Dimens.screenWidth,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _controller.userModel.name != null
                                    ? Text(
                                        '${_controller.userModel.name}',
                                        style: Styles.black12.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      )
                                    : Text(
                                        'Name',
                                        style: Styles.black12.copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                _controller.userModel.email != null
                                    ? Text(
                                  '${_controller.userModel.email}',
                                  style: Styles.black12.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                )
                                    : Text(
                                  'Email',
                                  style: Styles.black12.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Text(
                                  '${_controller.userModel.phone}',
                                  style: Styles.black12.copyWith(
                                      height: 1.5,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            IconButton(
                                icon: const Icon(Icons.edit), onPressed: () {
                                  RoutesManagement.goToEditProfile(_controller.userModel);
                            })
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ProfileTile(
                      title: 'Orders',
                      icon: Icons.card_travel,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    ProfileTile(
                      title: 'Favorites',
                      icon: Icons.favorite,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ProfileTile(
                      title: 'HelpCenter',
                      icon: Icons.message,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ProfileTile(
                      title: 'Register As Partner',
                      icon: Icons.meeting_room,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    ProfileTile(
                      title: 'About HomeEcart',
                      icon: Icons.details,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    ProfileTile(
                      title: 'Share HomeEcart',
                      icon: Icons.share,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    // ProfileTile(
                    //   title: 'Refers & Earn',
                    //   icon: Icons.money,
                    // ),
                    // const SizedBox(
                    //   height: 2,
                    // ),
                    ProfileTile(
                      title: 'Rate HomeEcart',
                      icon: Icons.share,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    // ProfileTile(
                    //   title: 'Payments Option',
                    //   icon: Icons.payment,
                    // ),
                    // const SizedBox(
                    //   height: 2,
                    // ),
                    const SizedBox(
                      height: 2,
                    ),
                    InkWell(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          RoutesManagement.goToLoginScreen();
                        },
                        child: ProfileTile(
                          title: 'Logout',
                          icon: Icons.logout,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(child: Text('HomeEcart',style: Styles.black18.copyWith(color: ColorsValue.primaryColor),)),
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
                      child:  Divider(color: Colors.black,),
                    )
                  ],
                )),
      );
}
