// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/controllers/choose_role_controller.dart';
// import 'package:lawyer/controllers/bottombar_controller.dart';
// import 'package:lawyer/utils/SharedPreferencesUser.dart';
// import 'package:lawyer/utils/colors.dart';
// import 'package:lawyer/views/actions/ask_me_anything.dart';
// import 'package:lawyer/views/actions/notifications.dart';
// import 'package:lawyer/views/chat/ContactList.dart';
// import 'package:lawyer/views/dashboard/consult%20lawyer/all_lawyers.dart';
// import 'package:lawyer/views/dashboard/home.dart';
// import 'package:lawyer/views/dashboard/legal_services.dart';
// import 'package:lawyer/views/dashboard/profile/lawyer_registration.dart';
// import 'package:lawyer/widgets/bottombar.dart';
// import 'package:lawyer/widgets/chatBot.dart';
// import 'package:draggable_fab/draggable_fab.dart';
// import '../appconstants/RepeatedVarables.dart';
// import '../choose_role.dart';

// class BottomBar extends StatefulWidget {
//   BottomBar({Key? key}) : super(key: key);

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.blackColor,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: Colors.white,
//         // centerTitle: true,
//         title: Obx(
//           () => Text(
//             '${landingPageController.title}',
//             style: const TextStyle(
//               color: Colors.black,
//             ),
//           ),
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Get.to(() => const NotificationScreen());
//             },
//             child: const Icon(
//               Icons.notifications,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(width: 15.w),
//           GestureDetector(
//             onTap: () {
//               Get.to(const Contacts());
//             },
//             child: const Icon(
//               Icons.chat,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(width: 15.w),
//           GestureDetector(
//             onTap: () async {
//               await FirebaseAuth.instance.signOut();
//               await SharedPreferencesUser.setUserType('');
//               Get.offAll(ChooseRoleScreen());
//             },
//             child: const Icon(
//               Icons.logout,
//               color: Colors.black,
//             ),
//           ),
//           SizedBox(width: 10.w),
//         ],
//       ),
//       body: Stack(
//         children: [
//           CustomGetXBottomBar(
//             one: const Home(),
//             two: const AllLawyers(),
//             three:
//                 ROLE == 'U' ? const LegalServices() : const RegisterAsLawyer(),
//             four: const RegisterAsLawyer(),
//           ),
//         ],
//       ),
//       bottomNavigationBar:
//           buildBottomNavigationMenu(context, landingPageController),
//     );
//   }

//   final LandingPageController landingPageController =
//       Get.put(LandingPageController(), permanent: false);

//   final chooseRoleController = Get.put(ChooseRoleController());
// }
