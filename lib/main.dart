import 'package:firebase_core/firebase_core.dart';
/// 22 Feb 08:37


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/routes/app_pages.dart';
import 'package:homeecart/app/theme/styles.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 745),
    builder: () => GetMaterialApp(
      title: 'Smart Crew',
      theme: Styles.lightTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login,
    ),
  );
}

