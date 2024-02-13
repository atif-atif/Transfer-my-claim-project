import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lawyer/controllers/bottombar_controller.dart';
import 'package:lawyer/controllers/choose_role_controller.dart';
import 'package:lawyer/views/dashboard/consult%20lawyer/all_lawyers.dart';
import 'package:lawyer/views/dashboard/home.dart';
import 'package:lawyer/views/dashboard/legal_services.dart';
import 'package:lawyer/views/dashboard/profile/lawyer_registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/SharedPreferencesUser.dart';
import 'package:lawyer/views/actions/notifications.dart';
import 'package:lawyer/views/chat/ContactList.dart';
import '../appconstants/RepeatedVarables.dart';
import '../choose_role.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const AllLawyers(),
    ROLE == 'U' ? const LegalServices() : const RegisterAsLawyer(),
    const RegisterAsLawyer(),
  ];
  void changeTabIndex(int index) {
    changeTitle(index);
    _selectedIndex = index;
  }

  var title = 'Enter your Claim';

  void changeTitle(int index) {
    switch (index) {
      case 0:
        title = 'Home';
        break;
      case 1:
        title = 'Consult Lawyers';
        break;
      case 2:
        ROLE == "U" ? title = 'Legal Services' : title = 'Lawyer Registration';
        break;
      case 3:
        title = 'Profile';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        // centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const NotificationScreen());
            },
            child: const Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 15.w),
          GestureDetector(
            onTap: () {
              Get.to(const Contacts());
            },
            child: const Icon(
              Icons.chat,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 15.w),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await SharedPreferencesUser.setUserType('');
              Get.offAll(ChooseRoleScreen());
            },
            child: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.white.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                const GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                const GButton(
                  icon: Icons.groups,
                  text: 'Lawyers',
                ),
                ROLE == "U"
                    ? const GButton(
                        icon: Icons.design_services_outlined,
                        text: 'Services',
                      )
                    : const GButton(
                        icon: Icons.app_registration,
                        text: 'Registration',
                      ),
                if (ROLE == "U")
                  const GButton(
                    icon: Icons.person,
                    text: 'Registration',
                  ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  // final LandingPageController controller =
  //     Get.put(LandingPageController(), permanent: false);

  final chooseRoleController = Get.put(ChooseRoleController());
}
