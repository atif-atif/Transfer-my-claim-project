import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/utils/colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  void Function()? action;
  Color? color;
  Color? textColor;
  Widget? icon;
  bool isDisable;
  double? borderRadius;
  bool isSecondaryButton;
  double? fontSize;
  double? width;

  CustomButton({
    Key? key,
    required this.text,
    required this.action,
    this.color,
    this.borderRadius,
    this.textColor,
    this.fontSize,
    this.isDisable = false,
    this.icon,
    this.isSecondaryButton = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 325.w,
      height: 56.h,
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color == null
                ? isSecondaryButton
                    ? AppColor.secondaryButtonColor
                    : isDisable
                        ? AppColor.lightGreyColor
                        : AppColor.primaryColor
                : color!),
            foregroundColor: MaterialStateProperty.all<Color>(textColor == null
                ? isSecondaryButton
                    ? AppColor.blackColor
                    : isDisable
                        ? AppColor.blackColor
                        : Color.fromARGB(255, 238, 53, 53)
                : textColor!),
            elevation: MaterialStateProperty.all(0),
            side: MaterialStateProperty.all<BorderSide>(BorderSide(
                color: isSecondaryButton
                    ? AppColor.greyColor
                    : isDisable
                        ? AppColor.lightGreyColor
                        : AppColor.primaryColor)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
            ))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontSize: fontSize ?? 17.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Color.fromARGB(255, 36, 34, 34)),
            ),
            icon != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: icon,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
