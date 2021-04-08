import 'package:flutter/material.dart';
import 'package:homeecart/app/modules/home/view/local_widget/profile_tile.dart';
import 'package:homeecart/app/theme/theme.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.grey.withOpacity(0.4),
    appBar: AppBar(
      elevation: 2,
      backgroundColor: ColorsValue.primaryColor,
      title: Text('MyProfile',style: Styles.white16.copyWith(fontWeight: FontWeight.w700,fontSize: 18),),
    ),
    body: ListView(
      children: [
        Container(
          height: 82,
          width: Dimens.screenWidth,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gaurav Kumar',style: Styles.black12.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                    Text('gaurabh.razput@gmail.com',style: Styles.black12.copyWith(height: 1.5,color: Colors.grey,fontWeight: FontWeight.w600),),
                    Text('+918539959795',style: Styles.black12.copyWith(height: 1.5,color: Colors.grey,fontWeight: FontWeight.w600),)
                  ],
                ),
                IconButton(icon: const Icon(Icons.edit), onPressed: (){})
              ],
            ),
          ),
        ),
        const SizedBox(height: 15,),
        ProfileTile(title: 'HelpCenter',icon: Icons.message,),
        const SizedBox(height: 15,),
        ProfileTile(title: 'Register As Partner',icon: Icons.meeting_room,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'About Smart Crew',icon: Icons.details,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'Share Smart Crew',icon: Icons.share,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'Refers & Earn',icon: Icons.money,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'My Gift Cards',icon: Icons.card_giftcard,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'My Wallet',icon: Icons.account_balance_wallet,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'Scheduled Booking',icon: Icons.details,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'Rate Smart Crew',icon: Icons.share,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'Payments Option',icon: Icons.payment,),
        const SizedBox(height: 2,),
        ProfileTile(title: 'Settings',icon: Icons.settings,),
        const SizedBox(height: 2,),


      ],
    ),
  );
}
