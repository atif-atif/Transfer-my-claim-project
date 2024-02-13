// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/authentication/controller/signup_controller.dart';
// import 'package:lawyer/authentication/view/tile_subtitle.dart';
// import 'package:lawyer/utils/app_constant.dart';
// import 'package:lawyer/utils/asset_path.dart';
// import 'package:lawyer/utils/colors.dart';
// import 'package:lawyer/widgets/custom_button.dart';
// import 'package:lawyer/widgets/custom_textfield.dart';
// import '../authentication_logo.dart';

// class CreateManagerScreen extends StatefulWidget {
//   const CreateManagerScreen({Key? key}) : super(key: key);

//   @override
//   State<CreateManagerScreen> createState() => _CreateManagerScreenState();
// }

// class _CreateManagerScreenState extends State<CreateManagerScreen> {
//   SignUpController signUpController = Get.put(SignUpController());

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     signUpController.managerNameFocusNode.value.addListener(() {
//       signUpController.managerNameFocusNode.refresh();
//     });
//     signUpController.managerEmailFocusNode.value.addListener(() {
//       signUpController.managerEmailFocusNode.refresh();
//     });
//     signUpController.managerPasswordFocusNode.value.addListener(() {
//       signUpController.managerPasswordFocusNode.refresh();
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
//               key: signUpController.managerFormKey,
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
//                     title: "Create manager role",
//                     subtitle:
//                         "Lorem ipsum is a placeholder text comm only used to demonstrate the visual.",
//                   ),
//                   SizedBox(
//                     height: 27.h,
//                   ),
//                   CustomTextField(
//                     controller: signUpController.txtManagerName.value,
//                     label: "Name",
//                     focusNode: signUpController.managerNameFocusNode.value,
//                   ),
//                   CustomTextField(
//                     controller: signUpController.txtManagerEmail.value,
//                     label: "Email",
//                     focusNode: signUpController.managerEmailFocusNode.value,
//                   ),
//                   CustomTextField(
//                     controller: signUpController.txtManagerPassword.value,
//                     label: "Password",
//                     focusNode: signUpController.managerPasswordFocusNode.value,
//                   ),
//                   Obx(
//                     () => GestureDetector(
//                       onTap: () {
//                         signUpController.managerNotifyEmail.value =
//                             !signUpController.managerNotifyEmail.value;
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 5.w),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                               signUpController.managerNotifyEmail.isTrue
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
//                                   color:
//                                       signUpController.managerNotifyEmail.isTrue
//                                           ? AppColor.blackColor
//                                           : AppColor.greyColor),
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
//                         signUpController.managerContinueAction();
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
