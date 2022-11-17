import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../services/service_auth.dart';
import '../../home/views/home_view.dart';

class AuthentificationController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeAdminController = TextEditingController();
  final load = false.obs;
  // TextEditingController emailController=TextEditingController();

  final isLogin = true.obs;
  final isAdmin = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  clear() {
    emailController.clear();
    passwordController.clear();
  }

  register(String email, String password) async {
    load.value = true;
    if (!email.isEmail || password.length < 6) {
      Fluttertoast.showToast(msg: "Email ou mot de passe invalide");
    } else {
      const codeAdmin = "ABCD";
      final res = await ServiceAuth().createUserWithEmailAndPassword(
          email, password, isAdmin.value, codeAdmin);
      if (res != null) {
        if (res) {
          clear();
          load.value = false;
          await Get.offAll(const HomeView());
        }
      }
    }
    load.value = false;
  }

  login(String email, String password) async {
    load.value = true;
    if (!email.isEmail || password.length < 6) {
      Fluttertoast.showToast(msg: "Email ou mot de passe invalide");
    } else {
      final res =
          await ServiceAuth().signInWithEmailAndPassword(email, password);
      if (res != null) {
        if (res) {
          clear();
          load.value = false;
          await Get.offAll(const HomeView());
        }
      }
    }
    load.value = false;
  }
}
