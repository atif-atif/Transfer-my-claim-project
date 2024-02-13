import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:pinput/pinput.dart';

class PinCodeTextField extends StatelessWidget {
  TextEditingController controller;
  Function(String)? onChange;
  PinCodeTextField({Key? key, required this.controller, this.onChange})
      : super(key: key);

  final defaultPinTheme = PinTheme(
    width: 56.w,
    height: 56.h,
    textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
    decoration: BoxDecoration(
        border: Border.all(color: AppColor.textFieldFilledColor),
        borderRadius: BorderRadius.circular(16.r),
        color: AppColor.textFieldFilledColor),
  );
  final enableTheme = PinTheme(
    width: 56.w,
    height: 56.h,
    textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
    decoration: BoxDecoration(
        border: Border.all(color: AppColor.greyColor),
        borderRadius: BorderRadius.circular(16.r),
        color: AppColor.black),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: enableTheme,
        length: 6,
        controller: controller,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        onChanged: onChange);
  }
}
