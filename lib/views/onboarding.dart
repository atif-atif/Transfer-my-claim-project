import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:lawyer/choose_role.dart';
import 'package:lawyer/views/dashboard/home.dart';
import 'package:lawyer/_not%20used/choose_role.dart';

class Onboarding extends StatelessWidget {
  static TextStyle onboardingTitleStyle =
      const TextStyle(color: Colors.black, fontSize: 30);
  static TextStyle onboardingSubtitleStyle =
      const TextStyle(color: Colors.black);
  final List<Introduction> list = [
    Introduction(
      title: 'Lawyer Consultation',
      subTitle:
          'A one stop destination for all your problems. Find eperienced lawyers near you and get legal advice. Read daily blogs and stay updated about the legal world',
      imageUrl: 'assets/onboarding1.png',
      titleTextStyle: onboardingTitleStyle,
      subTitleTextStyle: onboardingSubtitleStyle,
    ),
    Introduction(
      title: 'Learners',
      subTitle:
          'Here, you can get free question papers vital for your law education. Also find the best LLB notes of Pune University which will surely become an indispensable part of your studies.',
      imageUrl: 'assets/onboarding2.png',
      titleTextStyle: onboardingTitleStyle,
      subTitleTextStyle: onboardingSubtitleStyle,
    ),
    Introduction(
      title: 'Lawyer',
      subTitle:
          'A perfect platform to represent yourself as a lawyer by getting registered and to be found by just one click. Access the bare acts, various legal forms and write blogs.',
      imageUrl: 'assets/onboarding3.png',
      titleTextStyle: onboardingTitleStyle,
      subTitleTextStyle: onboardingSubtitleStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      // foregroundColor: Colors.white,
      backgroudColor: Colors.white,
      introductionList: list,
      skipTextStyle: const TextStyle(
        color: Colors.black,
      ),
      onTapSkipButton: () {
        Get.to(ChooseRoleScreen());
      },
      foregroundColor: Colors.red,
    );
  }
}
