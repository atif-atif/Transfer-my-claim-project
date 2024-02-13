// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton2 extends StatelessWidget {
  final String name;
  final double width;
  final VoidCallback? onPressed;

  const CustomButton2({
    Key? key,
    required this.name,
    this.width = double.infinity,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
            // color: PRIMARY_COLOR
            ),
        color: Colors.black,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 16.sp,
            // color: PRIMARY_COLOR,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
