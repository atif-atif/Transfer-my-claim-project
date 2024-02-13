// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lawyer/controllers/tabbar_controller.dart';
// import 'package:lawyer/utils/colors.dart';
// import 'package:lawyer/views/dashboard/consult%20lawyer/all_lawyers.dart';
// import 'package:lawyer/widgets/custom_text.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class ConsultLawyers extends StatelessWidget {
//   const ConsultLawyers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final MyTabController _tabController = Get.put(MyTabController());
//     // ↑ init tab controller

//     return Scaffold(
//       backgroundColor: AppColor.DARK_GREY,
//       body: DefaultTabController(
//         length: 3,
//         child: Column(
//           children: <Widget>[
//             Material(
//               elevation: 8,
//               color: AppColor.DARK_GREY,
//               child: TabBar(
//                 indicator: BoxDecoration(color: AppColor.DARK_GREY),
//                 labelColor: AppColor.ORANGE_COLOR,
//                 labelStyle: const TextStyle(color: AppColor.ORANGE_COLOR),
//                 unselectedLabelColor: Colors.red,
//                 controller: _tabController.controller,
//                 tabs: _tabController.topTabs,
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController.controller,
//                 children: const [
//                   AllLawyers(),
//                   Icon(Icons.directions_transit),
//                   Icon(Icons.directions_bike),
//                   Icon(Icons.directions_bike),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
