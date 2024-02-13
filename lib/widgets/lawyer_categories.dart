// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/widgets/custom_text.dart';

class LawyerCategories extends StatefulWidget {
  final callback;
  LawyerCategories({this.callback});

  @override
  State<LawyerCategories> createState() => _LawyerCategoriesState();
}

class _LawyerCategoriesState extends State<LawyerCategories> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            chooseRoleButton(title: 'Family', status: LawyerCategory.Family),
            SizedBox(width: 10.w),
            chooseRoleButton(
                title: 'Property', status: LawyerCategory.Property),
            SizedBox(width: 10.w),
            chooseRoleButton(
                title: 'Criminal', status: LawyerCategory.Criminal),
            SizedBox(width: 10.w),
            chooseRoleButton(title: 'Civil', status: LawyerCategory.Civil),
            SizedBox(width: 10.w),
            chooseRoleButton(
                title: 'Business', status: LawyerCategory.Business),
            SizedBox(width: 10.w),
            chooseRoleButton(
                title: 'Taxation', status: LawyerCategory.Taxation),
          ],
        ),
      ),
    );
  }

  chooseRoleButton({
    String? title,
    LawyerCategory? status,
  }) {
    bool isSelected = controller.currentLawyer.value.name.toLowerCase() ==
        title?.toLowerCase();
    return GestureDetector(
      onTap: () {
        controller.changeLawyerStatus(lawyerCategory: status!);
        widget.callback(value:title);
        setState(() {

        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 7.w,
          vertical: 3.h,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.ORANGE_COLOR : AppColor.DARK_GREY,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: AppColor.ORANGE_COLOR,
          ),
        ),
        child: Center(
            child: CustomText(
          title!,
          color: isSelected ? Colors.black : AppColor.ORANGE_COLOR,
        )),
      ),
    );
  }

  final controller = Get.put(LawyerCategoryController());
}

enum LawyerCategory {
  Family,
  Property,
  Criminal,
  Civil,
  Business,
  Taxation,
}

class LawyerCategoryController extends GetxController {
  Rx<LawyerCategory> currentLawyer = LawyerCategory.Family.obs;

  changeLawyerStatus({required LawyerCategory lawyerCategory}) {
    currentLawyer.value = lawyerCategory;
  }
}
