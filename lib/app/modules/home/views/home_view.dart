// ignore_for_file: avoid_unnecessary_containers

import 'package:appmanagement/app/component/button_sign.dart';
import 'package:appmanagement/app/component/load_page.dart';
import 'package:appmanagement/app/modules/home/views/admin_view.dart';
import 'package:appmanagement/app/modules/home/views/user_view.dart';
import 'package:appmanagement/app/services/firestore_service.dart';
import 'package:appmanagement/app/services/service_auth.dart';
import 'package:appmanagement/utils/constants/constant_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      // floatingActionButton:
      // controller.userInfom != null
      //     ? controller.userInfom!.isAdmin!
      //         ? FloatingActionButton(
      //             tooltip: "Ajouter une tache",
      //             onPressed: () {},
      //             child: const Icon(Icons.add),
      //           )
      //         : null
      //     : null,
      body: StreamBuilder(
        stream: DatabaseUser(user: FirebaseAuth.instance.currentUser).userInfo,
        builder: (context, snap) {
          return snap.hasData
              ? snap.data!.isAdmin!
                  ? AdminView(userInfom: snap.data!)
                  : UserView(
                      userInfom: snap.data!,
                    )
              // Column(
              //     children: [
              //       SizedBox(height: 20.h),
              //       appBar(snap.data!),
              //       SizedBox(height: 20.h),
              //       if (!snap.data!.isAdmin!)
              //         Expanded(
              //           child: Container(
              //             padding: EdgeInsets.symmetric(horizontal: 15.w),
              //             child: Column(
              //               children: [
              //                 const Text(
              //                   "Liste de mes tâches",
              //                   style: TextStyle(
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 20,
              //                   ),
              //                 ),
              //                 Expanded(
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Lottie.asset(
              //                           "assets/lotties/70032-task-on-clipboard-2.json"),
              //                       Text(
              //                         "Aucune tâche ne vous a été assigné pour l'instant",
              //                         textAlign: TextAlign.center,
              //                         style: TextStyle(fontSize: 16.sp),
              //                       )
              //                     ],
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ),
              //         )
              //     ],
              //   )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }

  Widget appBar(UserInfom userInfom) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userInfom.email!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                userInfom.isAdmin! ? "Administrateur" : "Utilisateur Simple",
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: "Deconnexion",
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.h),
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
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: ConstantColors.grayColor),
              width: 50,
              height: 50,
              child: const Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }

  logout() async {
    controller.homeLoad.value = true;
    await ServiceAuth.signOut();
  }
}
