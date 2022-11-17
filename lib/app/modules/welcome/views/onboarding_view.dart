// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:appmanagement/app/modules/authentification/views/authentification_view.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController controller = PageController();
  changeFirstInShared() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirst', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: controller, // PageController
              count: 3,
              effect: ExpandingDotsEffect(
                expansionFactor: 2.2,
                dotColor: Colors.grey.shade300,
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotWidth: 5,
                dotHeight: 10,
                spacing: 3,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                if (controller.page!.toInt() == 2) {
                  //next page
                  changeFirstInShared();
                  Get.offAll(AuthentificationView(),
                      transition: Transition.cupertino);
                } else {
                  controller.nextPage(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Icon(Icons.arrow_forward_rounded),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: TextButton(
              onPressed: () {
                changeFirstInShared();
                Get.offAll(AuthentificationView(),
                    transition: Transition.cupertino);
              },
              child: Text(
                "passer",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: const [
          OnBoardingPage(
            asset: "assets/lotties/12546-welcome.json",
            title: "Lorem Ipsum is simply dummy text of the",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ",
          ),
          OnBoardingPage(
            asset: "assets/lotties/12546-welcome.json",
            title: "Lorem Ipsum is simply dummy text of the",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ",
          ),
          OnBoardingPage(
            asset: "assets/lotties/12546-welcome.json",
            title: "Lorem Ipsum is simply dummy text of the",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem ",
          ),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final String? asset;
  final String? title;
  final String? description;

  const OnBoardingPage({Key? key, this.asset, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.height / 2.5,
              child: Lottie.asset(
                asset!,
                repeat: false,
              ),
            ),
            SizedBox(height: 130.h),
            Text(
              title!,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              description!,
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
