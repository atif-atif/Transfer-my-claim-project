// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/authentication/controller/signup_controller.dart';
// import 'package:lawyer/utils/app_constant.dart';
// import 'package:lawyer/utils/colors.dart';
// import 'package:lawyer/widgets/custom_button.dart';
// import 'package:lawyer/widgets/my_Custom_Button.dart';
// import 'package:lawyer/widgets/custom_textfield.dart';
// import '../authentication_logo.dart';
// import '../tile_subtitle.dart';

// class CreateBrandScreen extends StatefulWidget {
//   const CreateBrandScreen({Key? key}) : super(key: key);

//   @override
//   State<CreateBrandScreen> createState() => _CreateBrandScreenState();
// }

// class _CreateBrandScreenState extends State<CreateBrandScreen> {
//   SignUpController signUpController = Get.put(SignUpController());

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     signUpController.storeNameFocusNode.value.addListener(() {
//       signUpController.storeNameFocusNode.refresh();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//               horizontal: AppConstant.screenHorizontalPadding),
//           child: Obx(
//             () => Form(
//               key: signUpController.brandFormKey,
//               autovalidateMode: AutovalidateMode.always,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 63 - MediaQuery.of(context).viewPadding.top,
//                   ),
//                   AuthenticationLogo(
//                     backButton: true,
//                   ),
//                   SizedBox(height: 26.h),
//                   TitleSubtitle(
//                     title: "Create brand",
//                     subtitle:
//                         "Lorem ipsum is a placeholder text comm only used to demonstrate the visual.",
//                   ),
//                   SizedBox(
//                     height: 77.h,
//                   ),
//                   CustomTextField(
//                     controller: signUpController.txtStoreName.value,
//                     label: "Store name",
//                     focusNode: signUpController.storeNameFocusNode.value,
//                   ),
//                   SizedBox(
//                     height: 64.h,
//                   ),
//                   CustomButton(
//                       text: "Continue",
//                       action: () {
//                         signUpController.createBrandAction();
//                       }),
//                   SizedBox(
//                     height: 33.h,
//                   ),
//                   Center(
//                       child: Text(
//                     "or",
//                     style:
//                         TextStyle(fontWeight: FontWeight.w500, fontSize: 24.sp),
//                   )),
//                   SizedBox(
//                     height: 33.h,
//                   ),
//                   CustomButton(
//                     text: "Login",
//                     color: AppColor.secondaryColor,
//                     action: () {
//                       Get.back();
//                     },
//                     isSecondaryButton: true,
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Center(
//                       child: Text(
//                     "For Existing users only",
//                     style: TextStyle(color: AppColor.greyColor),
//                   ))
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
