// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lawyer/widgets/custom_text.dart';

// class MyTabController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   late TabController controller;

//   @override
//   void onInit() {
//     super.onInit();
//     controller = TabController(vsync: this, length: topTabs.length);
//   }

//   @override
//   void onClose() {
//     controller.dispose();
//     super.onClose();
//   }

//   final List<Tab> topTabs = <Tab>[
//     Tab(
//       icon: const Icon(Icons.home),
//       child: CustomText(
//         'Home',
//         fontSize: 11,
//         color: Colors.white,
//       ),
//     ),
//     Tab(
//       icon: const Icon(Icons.settings),
//       child: CustomText(
//         'Legal Services',
//         fontSize: 10,
//         color: Colors.white,
//       ),
//     ),
//     Tab(
//       icon: const Icon(Icons.question_mark),
//       child: CustomText(
//         'Law In Short',
//         fontSize: 11,
//         color: Colors.white,
//       ),
//     ),
//     Tab(
//       icon: const Icon(Icons.track_changes_outlined),
//       child: CustomText(
//         'Blogs',
//         fontSize: 11,
//         color: Colors.white,
//       ),
//     ),
//   ];
// }
