// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/authentication/controller/signup_controller.dart';
// import 'package:lawyer/authentication/view/tile_subtitle.dart';
// import 'package:lawyer/utils/app_constant.dart';
// import 'package:lawyer/utils/asset_path.dart';
// import 'package:lawyer/utils/colors.dart';
// import 'package:lawyer/widgets/Custom_Button.dart';
// import 'package:lawyer/widgets/custom_textfield.dart';
// import '../authentication_logo.dart';

// class CreateChefScreen extends StatefulWidget {
//   const CreateChefScreen({Key? key}) : super(key: key);

//   @override
//   State<CreateChefScreen> createState() => _CreateChefScreenState();
// }

// class _CreateChefScreenState extends State<CreateChefScreen> {
//   SignUpController signUpController = Get.put(SignUpController());

//   @override
//   void initState() {
//     super.initState();
//     signUpController.chefNameFocusNode.value.addListener(() {
//       signUpController.chefNameFocusNode.refresh();
//     });
//     signUpController.chefEmailFocusNode.value.addListener(() {
//       signUpController.chefEmailFocusNode.refresh();
//     });
//     signUpController.chefPasswordFocusNode.value.addListener(() {
//       signUpController.chefPasswordFocusNode.refresh();
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
//               key: signUpController.chefFormKey,
//               autovalidateMode: AutovalidateMode.always,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 63 - MediaQuery.of(context).viewPadding.top),
//                   AuthenticationLogo(
//                     backButton: true,
//                   ),
//                   SizedBox(
//                     height: 27.h,
//                   ),
//                   TitleSubtitle(
//                     title: "Create chef role",
//                     subtitle:
//                         "Lorem ipsum is a placeholder text comm only used to demonstrate the visual.",
//                   ),
//                   SizedBox(
//                     height: 27.h,
//                   ),
//                   CustomTextField(
//                     controller: signUpController.txtChefName.value,
//                     label: "Name",
//                     focusNode: signUpController.chefNameFocusNode.value,
//                   ),
//                   CustomTextField(
//                     controller: signUpController.txtChefEmail.value,
//                     label: "Email",
//                     focusNode: signUpController.chefEmailFocusNode.value,
//                   ),
//                   CustomTextField(
//                     controller: signUpController.txtChefPassword.value,
//                     label: "Password",
//                     focusNode: signUpController.chefPasswordFocusNode.value,
//                   ),
//                   Obx(
//                     () => GestureDetector(
//                       onTap: () {
//                         signUpController.chefNotifyEmail.value =
//                             !signUpController.chefNotifyEmail.value;
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 5.w),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               signUpController.chefNotifyEmail.isTrue
//                                   ? AssetPath.selectedCheckBox
//                                   : AssetPath.unSelectedCheckBox,
//                               height: 32.h,
//                               width: 32.h,
//                             ),
//                             SizedBox(
//                               width: 14.w,
//                             ),
//                             Text(
//                               "Notify user via email",
//                               style: TextStyle(
//                                   color: signUpController.chefNotifyEmail.isTrue
//                                       ? AppColor.blackColor
//                                       : AppColor.greyColor),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14.h,
//                   ),
//                   CustomButton(
//                       text: "Continue",
//                       action: () {
//                         signUpController.chefContinueAction();
//                       }),
//                   SizedBox(
//                     height: 26.h,
//                   ),
//                   CustomButton(
//                       text: "I will create them later",
//                       isSecondaryButton: true,
//                       action: () {}),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     ));
//   }
// }
