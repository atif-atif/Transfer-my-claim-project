import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/utils/colors.dart';

class AppStyle {
  static TextStyle onboardingTitle() {
    return TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w700);
  }

  static TextStyle onboardingDescription() {
    return TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400);
  }

  static TextStyle authenticationHeading() => TextStyle(
        fontSize: 30.sp,
        fontWeight: FontWeight.w600,
      );
  static TextStyle bodyHeadingStyle() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        color: AppColor.blackColor,
      );

  static TextStyle authenticationTitle() => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24.sp,
      );
  static TextStyle authenticationSubHeading() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 15.sp,
        color: AppColor.grey400,
      );
  static TextStyle textFieldLabel() => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
        color: AppColor.hintColor,
      );
  static TextStyle secondaryTextFieldLabel() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: AppColor.blackColor,
      );

  static TextStyle textFieldHint() => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
        color: AppColor.hintColor,
      );
  static TextStyle secondaryTextFieldHint() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        color: AppColor.grey500,
      );

  static TextStyle forgetStyle() => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 12.sp,
        color: AppColor.blackColor,
      );

  static TextStyle appbarTitle() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
      );
  static TextStyle manageRoleTitle() => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      );
  static TextStyle changePasswordHeading() => TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
      );
  static TextStyle chefAssignTask() => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
      );
}
