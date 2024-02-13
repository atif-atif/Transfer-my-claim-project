import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';


class ImageBubble extends StatelessWidget {
  const ImageBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText(
              '12:10 AM',
              color: Colors.grey,
              fontSize: 13.sp,
            ),
            Container(
              height: 155.h,
              width: 119.w,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Container(
                height: 153.h,
                width: 117.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Image.asset(""),
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}