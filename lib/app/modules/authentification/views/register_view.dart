import 'package:appmanagement/app/modules/home/views/home_view.dart';
import 'package:appmanagement/app/services/service_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../component/button_sign.dart';
import '../../../component/custom_text_input.dart';
import '../controllers/authentification_controller.dart';

class RegisterView extends GetView {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthentificationController>();

    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Center(
            child: Text(
              "Inscrivez vous",
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
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Je suis un administrateur ?"),
              Obx(() {
                return Switch.adaptive(
                    value: controller.isAdmin.value,
                    onChanged: (v) {
                      if (v) {
                        Get.defaultDialog(
                          title: "Entrer le code admin",
                          content: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: Column(
                              children: [
                                const Text(
                                  "Ceci est le code remis par le develeppeur (5 chiifres)",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                TextFormField(
                                  controller: controller.codeAdminController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "*****",
                                    border: UnderlineInputBorder(),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                ButtonSign(
                                    asset: null,
                                    onTap: () {
                                      if (controller.codeAdminController.text ==
                                          "11111") {
                                        controller.isAdmin.value = v;
                                        controller.codeAdminController.clear();
                                        Get.back();
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Code incorect");
                                      }
                                    },
                                    title: "Valider")
                              ],
                            ),
                          ),
                        );
                      } else {
                        controller.isAdmin.value = v;
                      }
                    });
              }),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          ButtonSign(
            asset: null,
            onTap: () async {
              String email = controller.emailController.value.text.trim();
              String password = controller.passwordController.value.text;
              await controller.register(email, password);
            },
            title: "S'inscrire",
          ),
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
