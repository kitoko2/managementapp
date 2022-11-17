import 'dart:async';

import 'package:appmanagement/app/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final homeLoad = false.obs;
  UserInfom? userInfom;

  final count = 0.obs;
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      homeLoad.value = true;
      await getUserToFirebase();
      homeLoad.value = false;
    });

    super.onInit();
  }

  getUserToFirebase() async {
    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(doc.data());
    userInfom = UserInfom(
      email: (doc.data() as dynamic)["email"],
      isAdmin: (doc.data() as dynamic)["isAdmin"],
      uid: (doc.data() as dynamic)["uid"],
      codeAdmin: (doc.data() as dynamic)["code_admin"],
    );
  }
}
