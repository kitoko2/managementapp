import 'package:appmanagement/app/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../utils/constants/constant_colors.dart';
import '../../../component/button_sign.dart';
import '../../../services/service_auth.dart';
import '../controllers/home_controller.dart';

class AdminView extends GetView {
  final UserInfom userInfom;
  const AdminView({Key? key, required this.userInfom}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.find<HomeController>();

    return Column(
      children: [
        SizedBox(height: 20.h),
        appBar(userInfom, homecontroller),
        SizedBox(height: 20.h),
        if (userInfom.isAdmin!)
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Text(
                    "Je suis admin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  // Expanded(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Lottie.asset(
                  //           "assets/lotties/70032-task-on-clipboard-2.json"),
                  //       Text(
                  //         "Aucune tâche ne vous a été assigné pour l'instant.",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(fontSize: 16.sp),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          )
      ],
    );
  }

  Widget appBar(UserInfom userInfom, HomeController controller) {
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
                          Get.back();
                          controller.homeLoad.value = true;
                          await ServiceAuth.signOut();
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
}
