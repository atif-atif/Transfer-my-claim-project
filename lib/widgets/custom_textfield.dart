import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lawyer/utils/app_style.dart';
import 'package:lawyer/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  String? hint;
  Function? onChange;
  bool? dealAsDate;
  bool? hide;
  bool? readOnly;
  String? suffixPath;
  String? prefixPath;
  bool? countryPicker;
  bool? genderPicker;
  double? bottomPadding;
  bool? isDetail;
  double? height;
  String? errorMessage;
  FocusNode? focusNode;
  Function? suffixAction;
  bool? enabled;
  String? Function(String?)? validator;
  void Function(String?)? onSaved;

  CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.hint,
      this.onChange,
      this.errorMessage,
      this.validator,
      this.onSaved,
      this.focusNode,
      this.height,
      this.prefixPath,
      this.readOnly,
      this.bottomPadding,
      this.enabled,
      this.dealAsDate,
      this.isDetail,
      this.countryPicker,
      this.genderPicker,
      this.hide,
      this.suffixAction,
      this.suffixPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 16.h),
      child: Container(
        height: isDetail != null ? height ?? 82.h : 64.h,
        width: 325.w,
        decoration: BoxDecoration(
          color: AppColor.textFieldFilledColor,
          // focusNode!.hasFocus
          //     ? AppColor.textFieldFilledColor
          //     : AppColor.textFieldFilledColor,
          // border: Border.all(
          //   color: focusNode!.hasFocus
          //       ? AppColor.blackColor
          //       : Colors.transparent,
          // ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Center(
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.top,
            expands: isDetail != null ? true : false,
            onChanged: onChange != null
                ? (val) {
                    onChange!();
                  }
                : null,
            validator: validator,
            onTap: () {
              print("tapped");
              FocusScope.of(context).requestFocus(focusNode);
              if (dealAsDate == true) {
                _selectDate(context);
              }
            },
            maxLines: isDetail != null ? null : 1,
            readOnly: dealAsDate ??
                countryPicker ??
                genderPicker ??
                readOnly ??
                false,
            obscureText: hide ?? false,
            cursorColor: AppColor.primaryColor,
            decoration: InputDecoration(
              hintStyle: AppStyle.textFieldHint(),
              contentPadding:
                  isDetail != null ? EdgeInsets.all(5.h) : EdgeInsets.zero,
              // filled: true,
              // fillColor: AppColor.textFieldFilledColor,
              border: InputBorder.none,
              labelText: label,
              isDense: true,
              labelStyle: AppStyle.textFieldLabel(),

              prefixIcon: prefixPath == null
                  ? SizedBox(
                      width: 15.w,
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: GestureDetector(
                        onTap: () {
                          if (suffixAction != null) {
                            suffixAction!();
                          }
                        },
                        child: Image.asset(
                          prefixPath!,
                          color: AppColor.hintColor,
                        ),
                      ),
                    ),
              prefixIconConstraints: BoxConstraints(
                maxHeight: 30.h,
                maxWidth: 30.w,
              ),
            ),
            onSaved: onSaved,
          ),
        ),
      ),
    );
  }

  borderStyle() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.blackColor),
        borderRadius: BorderRadius.circular(16.r));
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2040),
        builder: (BuildContext context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(),
              dialogBackgroundColor: AppColor.blackColor,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(newSelectedDate);
    }
  }
}
