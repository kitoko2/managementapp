import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ButtonSign extends StatelessWidget {
  final VoidCallback? onTap;
  final String? asset;
  final String? title;

  const ButtonSign(
      {super.key,
      required this.asset,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 290.w,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: 50.h,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: asset != null
              ? Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(asset!),
                    SizedBox(width: 40.w),
                    Text(title!)
                  ],
                )
              : Center(
                  child: Text(title!),
                ),
        ),
      ),
    );
  }
}
