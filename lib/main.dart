import 'package:appmanagement/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 804),
      builder: (context, w) {
        return GetMaterialApp(
          title: "Management app",
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppManagementTheme.lightTheme,
        );
      },
    ),
  );
}
