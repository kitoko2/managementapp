import 'package:appmanagement/app/modules/authentification/views/authentification_view.dart';
import 'package:appmanagement/app/modules/home/views/home_view.dart';
import 'package:appmanagement/app/modules/welcome/views/onboarding_view.dart';
import 'package:appmanagement/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

late bool isFirst;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final prefs = await SharedPreferences.getInstance();
  isFirst = prefs.getBool('isFirst') ?? true;
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 804),
      builder: (context, w) {
        return GetMaterialApp(
          title: "Management app",
          debugShowCheckedModeBanner: false,
          // initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppManagementTheme.lightTheme,
          home: const SwitchPages(),
        );
      },
    ),
  );
}

class SwitchPages extends StatelessWidget {
  const SwitchPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFirst
        ? const OnBoarding()
        : FirebaseAuth.instance.currentUser != null
            ? const HomeView()
            : const AuthentificationView();
  }
}
