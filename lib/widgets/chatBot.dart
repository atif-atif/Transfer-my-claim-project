import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/asset_path.dart';
import 'package:lawyer/views/actions/ask_me_anything.dart';
import 'package:lottie/lottie.dart';

final chatBot = DraggableFab(
  child: SizedBox(
    height: 200.h,
    width: 100.w,
    child: GestureDetector(
      onTap: () {
        Get.to(const AskMeAnything());
      },
      child: LottieBuilder.asset(
        AssetPath.chatBot,
      ),
    ),
  ),
);
