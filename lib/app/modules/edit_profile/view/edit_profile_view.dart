import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:homeecart/app/theme/theme.dart';

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      elevation: 1,
      backgroundColor: Colors.white,
      title: Text('Edit Profile',style: Styles.black18,),
    ),
    body: GetBuilder<EditProfileController>(
      builder: (_controller)=>Column(
        children: [

        ],
      ),
    ),
  );
}
