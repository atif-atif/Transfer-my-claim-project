// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/choose_role.dart';
import 'package:lawyer/views/bottom_bar.dart';
import 'package:lawyer/views/dashboard/admin/admin.dart';
import 'package:lawyer/views/nav_bar.dart';
import 'package:lawyer/views/onboarding.dart';
import 'apis/checkrole.dart';
import 'views/actions/notifications.dart';
// apply from: "$flutterRoot/packages/flutter_tools/gradle/flutter.gradle"

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// code is updated now on 10: 35
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(
        title: 'Justice',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.light,
          // add tabBarTheme
          tabBarTheme: TabBarTheme(
            labelColor: Color.fromARGB(255, 88, 27, 193),
            labelStyle: TextStyle(color: Colors.pink[800]), // color for text
            indicator: const UnderlineTabIndicator(
                // color for indicator (underline)
                // borderSide: BorderSide(color: ConstColor.primary),
                ),
          ),
          primaryColor: Colors.pink[800], //
          // primarySwatch: AppColor.black,
          textTheme: Typography.englishLike2021.apply(
            fontSizeFactor: 1.sp,
            bodyColor: Colors.black,
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'VarelaRound',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        // home: BottomNavBar(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (c, snapshot) {
            if (snapshot.hasData) {
              return FutureBuilder(
                future: checkrole(),
                builder: (context, shot) {
                  // print("**********************************************");
                  // print(shot.data);
                  // print("**********************************************");
                  return (shot.hasData && shot.data != null)
                      ? (shot.data == 'A')
                          ? const NotificationScreen()
                          : ChooseRoleScreen()
                      : const Text("Something went wrong");
                },
              );
            }
            return Onboarding();
          },
        ),
      ),
    );
  }
}
