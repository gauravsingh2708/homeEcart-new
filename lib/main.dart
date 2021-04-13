import 'package:firebase_core/firebase_core.dart';
/// 22 Feb 08:37
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/service/common_service.dart';
import 'package:homeecart/app/routes/app_pages.dart';
import 'package:homeecart/app/theme/styles.dart';
import 'package:homeecart/app/utils/utility.dart';

void main() async{
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await initServices();
    runApp(MyApp());
  } catch (error) {
    Utility.printELog(error.toString());
  }
}

/// Initialize the services before the app starts.
Future<void> initServices() async {
  await Firebase.initializeApp();
  Get.put(CommonService(), permanent: true,);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
    designSize: const Size(375, 745),
    builder: () => GetMaterialApp(
      title: 'HomeEcart',
      theme: Styles.lightTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.login,
    ),
  );
}

