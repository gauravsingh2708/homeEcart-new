import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/modules/edit_profile/controller/edit_profile_controller.dart';
import 'package:homeecart/app/theme/theme.dart';

class EditProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: ColorsValue.primaryColor,
      title: Text('Edit Profile',style: Styles.white14,),
    ),
    body: GetBuilder<EditProfileController>(
      builder:(_controller)=> Form(
        key: _controller.formKey,
        child: Padding(
          padding: EdgeInsets.all(Dimens.eight),
          child: ListView(
            children: [
              TextFormField(
                style: Styles.black18,
                initialValue: _controller.user.name ?? '',
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: Styles.black18,
                  labelText: 'Name',
                  labelStyle: Styles.black18,
                ),
                onChanged: (value){
                  _controller.user.name = value;
                },
                validator: (value)=> value.isEmpty || value.length < 3?'Enter Name':null,
              ),
              Dimens.boxHeight15,
              TextFormField(
                style: Styles.black18,
                initialValue: _controller.user.email ?? '',
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: Styles.black18,
                  labelText: 'Email',
                  labelStyle: Styles.black18,
                ),
                onChanged: (value){
                  _controller.user.email = value;
                },
                validator: (value)=> value.isEmpty|| !value.contains('@')?'Enter Email':null,
              ),
              Dimens.boxHeight15,
              TextFormField(
                style: Styles.black18,
                initialValue: _controller.user.landmark ?? '',
                decoration: InputDecoration(
                  hintText: 'Area',
                  hintStyle: Styles.black18,
                  labelText: 'Area',
                  labelStyle: Styles.black18,
                ),
                onChanged: (value){
                  _controller.user.landmark = value;
                },
                validator: (value)=> value.isEmpty?'Enter Area':null,
              ),
              Dimens.boxHeight15,
              TextFormField(
                style: Styles.black18,
                initialValue: _controller.user.city ?? '',
                decoration: InputDecoration(
                  hintText: 'City',
                  hintStyle: Styles.black18,
                  labelText: 'City',
                  labelStyle: Styles.black18,
                ),
                onChanged: (value){
                  _controller.user.city = value;
                },
                validator: (value)=> value.isEmpty?'Enter City':null,
              ),
              Dimens.boxHeight15,
              TextFormField(
                style: Styles.black18,
                initialValue: _controller.user.pinCode ?? '',
                decoration: InputDecoration(
                  hintText: 'PinCode',
                  hintStyle: Styles.black18,
                  labelText: 'PinCode',
                  labelStyle: Styles.black18,
                ),
                onChanged: (value){
                  _controller.user.pinCode = value;
                },
                validator: (value)=> value.isEmpty || value.length != 6?'Enter Correct PinCode':null,
              ),
              Dimens.boxHeight15,
              TextFormField(
                style: Styles.black18,
                initialValue: _controller.user.country ?? ' ',
                decoration: InputDecoration(
                  hintText: 'District',
                  hintStyle: Styles.black18,
                  labelText: 'District',
                  labelStyle: Styles.black18,
                ),
                onChanged: (value){
                  _controller.user.country = value;
                },
                validator: (value)=> value.isEmpty?'Enter District':null,
              ),
              Dimens.boxHeight15,
              InkWell(
                onTap: (){
                  _controller.updateUser();
                },
                child: Container(
                  width: Dimens.screenWidth,
                  height: Dimens.fifty,
                  decoration: BoxDecoration(
                      color: ColorsValue.primaryColor,
                      borderRadius: BorderRadius.circular(Dimens.ten)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Update',
                        style: Styles.white16,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
