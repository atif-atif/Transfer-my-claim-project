import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/asset_path.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/actions/ask_me_anything.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/views/chat/ContactList.dart';
import 'package:lawyer/widgets/custom_text.dart';
import 'package:carousel_pro/carousel_pro.dart';

class LegalServices extends StatelessWidget {
  const LegalServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            SizedBox(
              height: 250.0,
              width: double.infinity,
              child: Carousel(
                images: [
                  AssetImage(AssetPath.ONBOARDING1),
                  AssetImage(AssetPath.ONBOARDING2),
                  AssetImage(AssetPath.ONBOARDING3),
                ],
                dotSize: 5.0,
                dotSpacing: 15.0,
                dotColor: Colors.lightGreenAccent,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,
                //borderRadius: true,

                moveIndicatorFromBottom: 180.0,
                noRadiusForIndicator: true,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Wrap(
                runSpacing: 10,
                spacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.start,
                children: List.generate(
                  moduleList.length,
                  (i) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r))),
                    onPressed: moduleList[i].onTap,
                    child: Container(
                      height: 200.h,
                      width: 170.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColor.ORANGE_COLOR,
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 10.h),
                            SizedBox(
                              height: 100.h,
                              child: Image.asset(
                                moduleList[i].img,
                                color: Colors.black,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: CustomText(
                                    moduleList[i].title,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    fontSize: 20.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 13.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<LegalServiceModule> moduleList = [
  LegalServiceModule(
    'Bare Acts',
    AssetPath.COURT,
    () {
      Get.dialog(
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  color: AppColor.DARK_GREY,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              'Coming Soon',
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ),
  LegalServiceModule(
    'Lawyer Registration',
    AssetPath.WRITE,
    () {
      Get.dialog(
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  color: AppColor.DARK_GREY,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              'Kindly Switch to Lawyer mode for Register Yourself as lawyer',
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  ),
  LegalServiceModule(
    'Contacts',
    AssetPath.BLOGS,
    () {
      Get.to(() => const Contacts());
    },
  ),
  LegalServiceModule(
    'Ask Me Anything',
    AssetPath.guestBlogging,
    () {
      Get.to(const AskMeAnything());
    },
  ),
  // LegalServiceModule(
  //   'Bare Acts',
  //   AssetPath.COURT,
  //   () {},
  // ),
  // LegalServiceModule(
  //   'Lawyer Registration',
  //   AssetPath.WRITE,
  //   () {},
  // ),
  // LegalServiceModule(
  //   'Blogs',
  //   AssetPath.BLOGS,
  //   () {},
  // ),
  // LegalServiceModule(
  //   'Ask Me Anything',
  //   AssetPath.guestBlogging,
  //   () {
  //     Get.to(const AskMeAnything());
  //   },
  // ),
  // LegalServiceModule(
  //   'Bare Acts',
  //   AssetPath.COURT,
  //   () {},
  // ),
  // LegalServiceModule(
  //   'Lawyer Registration',
  //   AssetPath.WRITE,
  //   () {},
  // ),
  // LegalServiceModule(
  //   'Blogs',
  //   AssetPath.BLOGS,
  //   () {},
  // ),
  // LegalServiceModule(
  //   'Ask Me Anything',
  //   AssetPath.guestBlogging,
  //   () {
  //     Get.to(const AskMeAnything());
  //   },
  // ),
];

class LegalServiceModule {
  String title;
  String img;
  GestureTapCallback? onTap;
  LegalServiceModule(
    this.title,
    this.img,
    this.onTap,
  );
}
