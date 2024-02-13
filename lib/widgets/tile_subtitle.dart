import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/utils/app_style.dart';

class TitleSubtitle extends StatelessWidget {
  String? title;
  String? subtitle;
  TitleSubtitle({Key? key, this.title, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? 'Sign in',
            style: const TextStyle(color: Colors.black, fontSize: 30)),
        SizedBox(height: 8.h),
      ],
    );
  }
}
