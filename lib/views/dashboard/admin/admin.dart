import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/choose_role.dart';
import 'package:lawyer/utils/SharedPreferencesUser.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/actions/notifications.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_text.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      appBar: AppBar(
        backgroundColor: AppColor.DARK_GREY,
        title: const Text(
          'Admin',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await SharedPreferencesUser.setUserType('');
              Get.to(const NotificationScreen());
            },
            child: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 15.w),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await SharedPreferencesUser.setUserType('');
              Get.offAll(ChooseRoleScreen());
            },
            child: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 50.h),
              CustomText(
                'Welcome to Admin Dashboard',
                fontSize: 25.sp,
              ),
              SizedBox(height: 50.h),
              CustomText('You can manage all Lawyers here.'),
              SizedBox(height: 50.h),
              CustomButton(
                  text: 'See Lawyer Requests',
                  action: () {
                    Get.to(const NotificationScreen());
                  }),
              SizedBox(height: 50.h),
              // CustomText('or'),
              SizedBox(height: 50.h),
              // CustomButton(
              //   text: 'Logout',
              //   width: Get.width * 0.5,
              //   color: Colors.green,
              //   action: () async {
              //     await FirebaseAuth.instance.signOut();
              //     await SharedPreferencesUser.setUserType('');
              //     Get.offAll(ChooseRoleScreen());
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
