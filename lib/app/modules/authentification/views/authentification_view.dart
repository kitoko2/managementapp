import 'package:appmanagement/app/component/custom_text_input.dart';
import 'package:appmanagement/app/component/load_page.dart';
import 'package:appmanagement/app/modules/authentification/views/login_view.dart';
import 'package:appmanagement/app/modules/authentification/views/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/authentification_controller.dart';

class AuthentificationView extends GetView<AuthentificationController> {
  const AuthentificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    Get.put(AuthentificationController());

    return Obx(() {
      return controller.load.value
          ? const LoadPage()
          : Scaffold(
              bottomSheet: isKeyboard ? null : bottomSheetCustom(),
              body: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300.h,
                        child:
                            Lottie.asset("assets/lotties/42476-register.json"),
                      ),
                      Obx(() {
                        return controller.isLogin.value
                            ? const LoginView()
                            : const RegisterView();
                      }),
                    ],
                  )),
            );
    });
  }

  Widget bottomSheetCustom() {
    return Container(
      color: Colors.white,
      height: 35.h,
      width: double.infinity,
      child: Obx(() {
        return controller.isLogin.value
            ? RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Vous n'avez pas de compte ?",
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "proxima"),
                    children: [
                      TextSpan(
                        text: "  S'inscrire",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            controller.clear();
                            controller.isLogin.value = false;
                          },
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              )
            : RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Vous avez un  de compte ?",
                    style: const TextStyle(
                        color: Colors.black, fontFamily: "proxima"),
                    children: [
                      TextSpan(
                        text: "  Se connecter",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            controller.clear();
                            controller.isLogin.value = true;
                          },
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              );
      }),
    );
  }
}
