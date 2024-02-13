// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Custom_Button2.dart';

class MyCustomButton extends StatelessWidget {
  final String name;
  // ---- ? means, height can be null
  double? height;
  double? width;
  bool loading;
  Color? color;
  double? fontsize;
  Color? textColor;
  final VoidCallback? onPressed;

  MyCustomButton({
    Key? key,
    required this.name,
    this.color,
    this.textColor,
    this.height,
    this.fontsize,
    this.loading = false,
    this.width,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading
        ? const CustomButton2(name: 'Please Wait...')
        : Column(
            children: [
              SizedBox(height: 20.h),
              InkWell(
                onTap: onPressed,
                child: Container(
                  //----------------> ?? means if height is null then assign assign 50.h else apply user entered height
                  height: height ?? 50.h,
                  width: width ?? double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r), color: color
                      // border: Border.all(color: PRIMARY_COLOR),
                      // color: color ?? PRIMARY_COLOR,
                      ),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: fontsize,
                        color: textColor ?? Colors.black,
                        fontWeight: FontWeight.w400,
                        // backgroundColor: color,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
