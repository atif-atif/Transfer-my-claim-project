import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  String? label;
  String? errorText;
  TextEditingController? controller;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  Function(String?)? onSaved;
  Widget? icon;
  bool? obscureText;
  bool? visibility;
  bool? dataFieldStyle;
  bool readOnly;
  Function? onShowPassword;
  IconButton? suffixicon;
  IconData? prefixIcon;
  Widget? prefixIconWidget;
  int? minLines;
  int? maxLines;
  String? hintText;
  final String? Function(String?)? validator;

  CustomTextFormField(
    this.label, {
    this.minLines,
    this.suffixicon,
    this.prefixIcon,
    this.errorText,
    this.maxLines,
    this.prefixIconWidget,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.onSaved,
    this.controller,
    this.icon,
    this.obscureText = false,
    this.visibility = false,
    this.dataFieldStyle = true,
    this.onShowPassword,
    this.validator,
    this.hintText,
    Key? key,
  }) : super(key: key);

  // final passController = Get.put(PassController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText!,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onSaved: onSaved,
          decoration: InputDecoration(
            prefixIcon: prefixIconWidget ??
                Icon(
                  prefixIcon,
                  color: Color.fromARGB(255, 253, 59, 0),
                ),
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              // borderSide: const BorderSide(color: LIGHT_COLOR),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              // borderSide: const BorderSide(color: Colors.blueAccent),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 15.h,
              horizontal: 15.w,
            ),
            label: CustomText(
              label!,
              color: Colors.black,
            ),
            suffixIcon: suffixicon,
            // visibility == true
            //     ? InkWell(
            //         child: icon,
            //         onTap: () {
            //           onShowPassword!();
            //         },
            //       )
            //     : null,
            hintText: hintText,
            hintMaxLines: 5,
            labelStyle: const TextStyle(color: Colors.black),
            hintStyle: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromARGB(255, 14, 13, 13),
            ),
          ),
          minLines: minLines,
          maxLines: maxLines,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColor.black,
          ),
          validator: validator ??
              (value) {
                // RegExp regex = RegExp(r'^.{3,}$');
                if (value!.isEmpty) {
                  return ("Please Enter your Full Name");
                }
                // if (!regex.hasMatch(value)) {
                //   return ("Please Enter Valid Name");
                // }
                return null;
              },
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  void dissmissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
