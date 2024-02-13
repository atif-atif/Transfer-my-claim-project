// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// class OtpController extends GetxController {
//   Timer? countdownTimer;
//   var remainingTime = '02:00'.obs;

//   int timerForSeconds = 120;

//   var txtPinInput = TextEditingController().obs;

//   var loading = false.obs;
//   var resending = false.obs;

//   Timer? _timer;

//   void startTimer() {
//     const oneSec = const Duration(seconds: 1);
//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         if (timerForSeconds <= 0) {
//           _timer?.cancel();
//         }
//         remainingTime.value = formatedTime(time: timerForSeconds);
//         timerForSeconds--;
//       },
//     );
//   }

//   void resetTimer() {
//     timerForSeconds = 120;
//     const oneSec = const Duration(seconds: 1);
//     _timer = Timer.periodic(
//       oneSec,
//       (Timer timer) {
//         if (timerForSeconds <= 0) {
//           _timer?.cancel();
//         }
//         remainingTime.value = formatedTime(time: timerForSeconds);
//         timerForSeconds--;
//       },
//     );
//   }

//   String formatedTime({required int time}) {
//     int sec = time % 60;
//     int min = (time / 60).floor();
//     String minute = min.toString().length <= 1 ? "0$min" : "$min";
//     String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
//     return "$minute:$second";
//   }

//   verifyOtp() async {
//     // Get.to(AccountSuccessScreen());
//   }

//   resendOtp() async {}
// }
