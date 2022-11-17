import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../component/button_sign.dart';
import '../../../component/custom_text_input.dart';
import '../controllers/authentification_controller.dart';

class LoginView extends GetView {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthentificationController>();
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // Lottie.asset("assets/lotties/42476-register.json"),
          Center(
            child: Text(
              "Connectez vous",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Connectez vous pour avoir acces à votre interface",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17.sp),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextInput(
            controller: controller.emailController,
            hintText: "Entrer un email",
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomTextInput(
            controller: controller.passwordController,
            hintText: "Entrer votre mot de passe",
          ),
          SizedBox(
            height: 50.h,
          ),
          ButtonSign(
              asset: null,
              onTap: () async {
                String email = controller.emailController.value.text.trim();
                String password = controller.passwordController.value.text;
                controller.isLogin.value = false;

                await controller.login(email, password);
              },
              title: "Se connecter"),
          SizedBox(
            height: 20.h,
          ),
          // ButtonSign(
          //     asset: "assets/logos/Google.svg",
          //     onTap: () {},
          //     title: "Continuer avec google"),
        ],
      ),
    );
  }
}
