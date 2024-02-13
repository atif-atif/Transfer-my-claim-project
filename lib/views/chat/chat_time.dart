import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_text.dart';

class CustomTime extends StatelessWidget {
  String? month;
  int? date;
  int? year;
  final showYear;
  CustomTime({
    this.month = 'January',
    this.date = 21,
    this.year = 2022,
    this.showYear = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          month!,
          fontSize: 13.sp,
          color: Colors.grey,
        ),
        CustomText(
          ',',
          fontSize: 13.sp,
          color: Colors.grey,
        ),
        SizedBox(width: 4.w),
        CustomText(
          '$date',
          fontSize: 13.sp,
          color: Colors.grey,
        ),
        SizedBox(width: 4.w),
        showYear == true
            ? CustomText(
                 '$year',
                fontSize: 13.sp,
                color: Colors.grey,
              )
            : const SizedBox(),
      ],
    );
  }
}
