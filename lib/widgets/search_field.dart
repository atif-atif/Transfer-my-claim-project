// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/utils/colors.dart';

class CustomSearchField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? filter;
  final GestureTapCallback? onFilterTap;

  CustomSearchField({
    Key? key,
    this.hint,
    this.controller,
    this.keyboardType,
    this.filter = false,
    this.onFilterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: AppColor.DARK_BLUE),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColor.DARK_BLUE),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: filter == true
            ? InkWell(
                onTap: onFilterTap,
                child: const Icon(
                  Icons.filter_list_rounded,
                  color: AppColor.GREY,
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
