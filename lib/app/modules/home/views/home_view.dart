// ignore_for_file: avoid_unnecessary_containers

import 'package:appmanagement/app/component/button_sign.dart';
import 'package:appmanagement/app/component/load_page.dart';
import 'package:appmanagement/app/services/firestore_service.dart';
import 'package:appmanagement/app/services/service_auth.dart';
import 'package:appmanagement/utils/constants/constant_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Obx(() {
      return controller.homeLoad.value
          ? const LoadPage()
          : Scaffold(
              body: StreamBuilder(
                stream: DatabaseUser(user: FirebaseAuth.instance.currentUser)
                    .userInfo,
                builder: (context, snap) {
                  return snap.hasData
                      ? ListView(
                          children: [
                            Container(
                              color: ConstantColors.primaryColor3,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snap.data!.email!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        snap.data!.isAdmin!
                                            ? "Administrateur"
                                            : "Utilisateur Simple",
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.defaultDialog(
                                        title: "Deconnexion",
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.h, horizontal: 15.h),
                                        content: Container(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Voulez-vous vraiment vous deconnectez?",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.h,
                                              ),
                                              ButtonSign(
                                                asset: null,
                                                onTap: () async {
                                                  await logout();
                                                },
                                                title: "Oui je me déconnecte",
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: ConstantColors.grayColor),
                                      width: 50,
                                      height: 50,
                                      child: Icon(Icons.person),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            );
    });
  }

  logout() async {
    controller.homeLoad.value = true;
    await ServiceAuth.signOut();
  }
}
