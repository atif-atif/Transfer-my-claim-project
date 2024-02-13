import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/app_constant.dart';
import 'package:lawyer/utils/asset_path.dart';
import 'package:lawyer/widgets/custom_button.dart';

class AccountSuccessScreen extends StatelessWidget {
  const AccountSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppConstant.screenHorizontalPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetPath.check,
                height: 72.h,
                width: 72.w,
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 215.w,
                child: Text(
                  'You have successfully created your account',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 201.h,
              ),
              CustomButton(
                  text: "Finish",
                  action: () {
                    // Get.to( BottomNavigationScreen());
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
