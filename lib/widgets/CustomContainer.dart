import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/widgets/custom_text.dart';

class CustomContainer extends StatelessWidget {
  double? height;
  double? width;
  double? borderwidth;
  Color? color;
  Color? borderColor;
  double? circularRadius;
  String? title;
  Widget? child;
  CustomContainer({
    this.height,
    this.width,
    this.borderwidth,
    this.color,
    this.borderColor,
    this.circularRadius,
    this.title,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? Get.width * 0.41,
      decoration: BoxDecoration(
        color: color ?? AppColor.orangeColor,
        borderRadius: BorderRadius.circular(circularRadius ?? 10.r),
        border: Border.all(
          width: borderwidth ?? 4,
          color: borderColor ?? Color.fromARGB(255, 163, 121, 121),
        ),
      ),
      child: child ??
          Center(
            child: CustomText(
              title!,
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
    );
  }
}
