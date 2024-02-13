import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/controllers/choose_role_controller.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/auth/singin_screen.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_text.dart';

import 'apis/setRoles.dart';
import 'utils/SharedPreferencesUser.dart';

class ChooseRoleScreen extends StatefulWidget {
  ChooseRoleScreen({super.key});

  @override
  State<ChooseRoleScreen> createState() => _ChooseRoleScreenState();
}

class _ChooseRoleScreenState extends State<ChooseRoleScreen> {
  final chooseRoleController = Get.put(ChooseRoleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 219, 219, 219),
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 60.h),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Welcome to\nTransfer My Claim',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 78, 189, 82),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              const Text(
                'Choose Your Role here',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              chooseRoleButton(
                  title: 'User',
                  status: RoleStatus.USER,
                  color: Color.fromARGB(255, 137, 49, 8)),
              chooseRoleButton(
                  title: 'Lawyer',
                  status: RoleStatus.LAWYER,
                  color: Color.fromARGB(255, 255, 90, 78)),
              chooseRoleButton(
                  title: 'Admin',
                  status: RoleStatus.ADMIN,
                  color: Color.fromARGB(255, 206, 41, 54)),
              Expanded(
                  child:
                      CustomText('${roleController.currentRoleStatus.value}')),
              CustomButton(
                  text: 'Next',
                  color:
                      roleController.currentRoleStatus.value == RoleStatus.USER
                          ? Color.fromARGB(255, 247, 90, 18)
                          : roleController.currentRoleStatus.value ==
                                  RoleStatus.LAWYER
                              ? Color.fromARGB(255, 255, 90, 78)
                              : Color.fromARGB(255, 206, 41, 54),
                  action: () {
                    // chooseRoleController.changeRoleStatus(
                    //     roleStatus:
                    //         chooseRoleController.currentRoleStatus.value);
                    // print(chooseRoleController.getCurrentRole());

                    Get.to(const SignInScreen());
                  }),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  chooseRoleButton({String? title, RoleStatus? status, Color? color}) {
    bool isSelected =
        chooseRoleController.currentRoleStatus.value.name.toLowerCase() ==
            title?.toLowerCase();

    return FutureBuilder(
        future:
            setRoles(role: chooseRoleController.currentRoleStatus.value.name),
        builder: (context, shot) {
          return GestureDetector(
            onTap: () async {
              chooseRoleController.changeRoleStatus(roleStatus: status!);
            },
            child: Column(
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: isSelected ? color : AppColor.secondaryButtonColor,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(
                      color: isSelected
                          ? AppColor.primaryColor
                          : AppColor.greyColor,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      color: isSelected
                          ? AppColor.secondaryButtonColor
                          : AppColor.greyColor,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: isSelected ? color : AppColor.greyColor,
                  ),
                )
              ],
            ),
          );
        });
  }

  final roleController = Get.put(ChooseRoleController());
}
