import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

customSnackBar(String title, String detail) {
  Get.snackbar(
    title,
    detail,
    backgroundColor: Colors.grey,
    colorText: Colors.black,
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
  );
}

