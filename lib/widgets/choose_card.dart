import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/widgets/custom_text.dart';

class ChooseCard extends StatelessWidget {
  String title;
  void Function()? onTap;
  Widget? img;
  ChooseCard(
    this.title,
    this.onTap, {
    this.img,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 120.h,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            color: Colors.black,
            child: Row(
              children: [
                SizedBox(width: 30.w),
                CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColor.ORANGE_COLOR,
                    child: img),
                SizedBox(width: 20.w),
                Expanded(
                  child: CustomText(
                    title,
                    maxLines: 2,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
