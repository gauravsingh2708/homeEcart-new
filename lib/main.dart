import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

/// 22 Feb 08:37
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:homeecart/app/data/service/common_service.dart';
import 'package:homeecart/app/data/service/user_service.dart';
import 'package:homeecart/app/routes/app_pages.dart';
import 'package:homeecart/app/theme/styles.dart';
import 'package:homeecart/app/utils/utility.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    var uid = await initServices();
    runApp(MyApp(
      uid: uid,
    ));
  } catch (error) {
    Utility.printELog(error.toString());
  }
}

/// Initialize the services before the app starts.
Future<String> initServices() async {
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  var currentUserUid = user == null ? '' : user.uid;
  Get.put(
    CommonService(),
    permanent: true,
  );
  if (currentUserUid.isNotEmpty) {
    Get.put(
      UserService(),
      permanent: true,
    );
  }
  return currentUserUid;
}

class MyApp extends StatelessWidget {
  MyApp({this.uid});
  final String uid;
  @override
  Widget build(BuildContext context) =>  ScreenUtilInit(
        designSize: const Size(375, 745),
        builder: () => GetMaterialApp(
                title: 'HomeEcart',
                theme: Styles.lightTheme,
                debugShowCheckedModeBanner: false,
                getPages: AppPages.pages,
                initialRoute: uid.isNotEmpty ? AppRoutes.home : AppRoutes.login,
              )
      );
}
