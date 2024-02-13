// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/controllers/bottombar_controller.dart';
// import 'package:lawyer/utils/asset_path.dart';
// import 'package:lawyer/views/dashboard/consult_lawyers.dart';
// import 'package:lawyer/views/dashboard/home.dart';
// import 'package:lawyer/views/dashboard/legal_services.dart';
// import 'package:lawyer/widgets/choose_card.dart';
// import 'package:lawyer/widgets/custom_text.dart';

// import 'bottom_bar.dart';

// class ChooseRole extends StatelessWidget {
//    ChooseRole({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 30.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: 150.h),
//             CustomText(
//               'The Lawyers Space',
//               fontSize: 35.sp,
//             ),
//             SizedBox(height: 25.h),
//             ChooseCard(
//               'I want to consult a Lawyer',
//               () {
//                 Get.to( BottomBar());
//                 landingPageController.tabIndex.value = 1;
//               },
//               img: const Icon(
//                 Icons.groups_rounded,
//                 size: 35,
//                 color: Colors.white,
//               ),
//             ),
//             ChooseCard(
//               'I am a Lawyer',
//               () {
//                 Get.to( BottomBar());
//                 landingPageController.tabIndex.value = 2;
//               },
//               img: Image.asset(
//                 AssetPath.COURT,
//                 color: Colors.white,
//                 height: 35.h,
//                 width: 35.w,
//               ),
//             ),
//             ChooseCard(
//               'I am a Law Student',
//               () {
//                 Get.to( BottomBar());
//                 landingPageController.tabIndex.value = 0;
//               },
//               img: Image.asset(
//                 AssetPath.STUDAY,
//                 color: Colors.white,
//                 height: 35.h,
//                 width: 35.w,
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         height: 50,
//         color: Colors.black,
//         child: Padding(
//           padding: EdgeInsets.only(left: 20.w),
//           child: Row(
//             children: [
//               CustomText(
//                 'Designed and Developed by ',
//                 fontSize: 14.sp,
//               ),
//               CustomText(
//                 'Shah Rasool',
//                 fontSize: 14.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   LandingPageController landingPageController =
//       Get.put(LandingPageController());
// }
