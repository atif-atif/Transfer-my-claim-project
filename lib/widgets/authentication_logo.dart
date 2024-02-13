import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/asset_path.dart';

class AuthenticationLogo extends StatelessWidget {
  bool? backButton;
  AuthenticationLogo({this.backButton = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backButton == true
            ? Align(
                alignment: Alignment.topLeft,
                child: BackButton(
                  onPressed: () {},
                ),
              )
            : const SizedBox(),
        Center(
          child: Image.asset(
            AssetPath.guestBlogging,
            height: 100.h,
            width: 100.w,
          ),
        ),
      ],
    );
  }
}
