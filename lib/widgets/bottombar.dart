// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/appconstants/RepeatedVarables.dart';
// import 'package:lawyer/controllers/choose_role_controller.dart';
// import 'package:lawyer/controllers/bottombar_controller.dart';
// import 'package:lawyer/utils/asset_path.dart';
// import 'package:lawyer/utils/colors.dart';

// class CustomGetXBottomBar extends StatelessWidget {
//   LandingPageController landingPageController =
//       Get.put(LandingPageController(), permanent: true);

//   Widget one;
//   Widget two;
//   Widget three;
//   Widget four;
//   // Widget profile;
//   CustomGetXBottomBar({
//     required this.one,
//     required this.two,
//     required this.three,
//     required this.four,
//     // required this.profile,
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => IndexedStack(
//         index: landingPageController.tabIndex.value,
//         children: <Widget>[one, two, three, if (ROLE == 'U') four],
//       ),
//     );
//   }
// }

// buildBottomNavigationMenu(context, landingPageController) {
//   return Obx(
//     () => BottomNavigationBar(
//       backgroundColor: AppColor.DARK_GREY,
//       elevation: 0,
//       type: BottomNavigationBarType.fixed,
//       unselectedItemColor: Colors.white,
//       selectedLabelStyle: const TextStyle(fontSize: 12),
//       unselectedLabelStyle: const TextStyle(fontSize: 12),
//       selectedItemColor: AppColor.ORANGE_COLOR,
//       currentIndex: landingPageController.tabIndex.value,
//       onTap: landingPageController.changeTabIndex,
//       items: [
//         bottomNavItem(
//           AssetPath.STUDAY,
//           'Home',
//           isSelected: landingPageController.tabIndex == 0,
//           toolTip: 'Law Study Material',
//         ),
//         bottomNavItem(
//           AssetPath.GROUP,
//           'Consult Lawyers',
//           isSelected: landingPageController.tabIndex == 1,
//           toolTip: 'Consult Lawyers',
//         ),
//         ROLE == "U"
//             ? bottomNavItem(
//                 AssetPath.COURT,
//                 'Services',
//                 isSelected: landingPageController.tabIndex == 2,
//                 toolTip: 'Legal Services',
//               )
//             : bottomNavItem(
//                 AssetPath.COURT,
//                 'Registration',
//                 isSelected: landingPageController.tabIndex == 2,
//                 toolTip: 'Lawyers',
//               ),
//         if (ROLE == "U")
//           bottomNavItem(AssetPath.COURT, 'Profile',
//               isSelected: landingPageController.tabIndex == 3, toolTip: 'user')
//       ],
//     ),
//   );
// }

// bottomNavItem(
//   String imgPath,
//   String label, {
//   required bool isSelected,
//   String? toolTip,
// }) {
//   return BottomNavigationBarItem(
//     tooltip: toolTip,
//     icon: Image(
//       height: 28.h,
//       width: 28.w,
//       image: AssetImage(imgPath),
//       color: isSelected ? AppColor.ORANGE_COLOR : Colors.white,
//     ),
//     label: label,
//   );
// }
