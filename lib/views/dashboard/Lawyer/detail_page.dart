import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lawyer/models/user_model.dart';
import 'package:lawyer/utils/asset_path.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/dashboard/Lawyer/book_consultation.dart';
import 'package:lawyer/views/dashboard/home.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_text_field.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:lawyer/widgets/custom_text.dart';

import '../../../apis/calculaterating.dart';
import '../../../appconstants/RepeatedVarables.dart';
import '../../chat/chat_screen.dart';

class LawyerDetailScreen extends StatefulWidget {
  final lawyer;
  LawyerDetailScreen({this.lawyer});

  @override
  State<LawyerDetailScreen> createState() => _LawyerDetailScreenState();
}

class _LawyerDetailScreenState extends State<LawyerDetailScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedinUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection(ROLE == "U"
            ? "users"
            : ROLE == "A"
                ? "admin"
                : "lawyers")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedinUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: AppColor.black,
              child: Container(
                height: Get.height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     AssetPath.doctor3,
                  //   ),
                  // )
                ),
                child: Image.network(widget.lawyer['image'] ?? "",
                    //'https://th.bing.com/th/id/R.1b98895206107fcf2212d0126556d5f6?rik=XWEzwowuLM6t8Q&pid=ImgRaw&r=0',
                    height: MediaQuery.of(context).size.height / 2,
                    width: Get.width,
                    fit: BoxFit.cover, errorBuilder: (BuildContext context,
                        Object exception, StackTrace? stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.black,
                  );
                }, loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.h, left: 15.w),
            child: Container(
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColor.orangeColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: BackButton(
                color: AppColor.whiteColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height * 0.6,
              decoration: BoxDecoration(
                color: AppColor.DARK_GREY,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              child: lawyerDetails(context),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Row(
                children: [
                  CustomButton(
                    color: AppColor.orangeColor,
                    width: Get.width * .75,
                    text: 'Book Consultation',
                    action: () {
                      Get.to(ConsultationBooking(lawyer: widget.lawyer));
                    },
                  ),
                  SizedBox(width: 10.w),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => ChatScreen(id: widget.lawyer['uid']));
                    },
                    child: Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                        color: AppColor.orangeColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.chat,
                        color: AppColor.whiteColor,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget lawyerDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25.h),
            Row(
              children: [
                CustomText(
                  '${widget.lawyer['userName'] ?? ""} ',
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
                SizedBox(width: 5.h),
                Icon(
                  Icons.check_circle,
                  color: AppColor.orangeColor,
                  size: 20,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
            // FutureBuilder(
            //     future: calculaterating(list: widget.lawyer['ratings'] ?? []),
            //     builder: (context, snap) {
            //       return SmoothStarRating(
            //         allowHalfRating: false,
            //         starCount: 5,
            //         rating: (snap.data == null || snap.data.toString() == "NaN")
            //             ? 0
            //             : snap.data,
            //         size: 23.0,
            //         filledIconData: Icons.star,
            //         halfFilledIconData: Icons.blur_on,
            //         color: AppColor.orangeColor,
            //         borderColor: AppColor.orangeColor,
            //         spacing: 0.0,
            //       );
            //     }),
            Row(
              children: [
                CustomText(
                  'Speaciality of lawyer : ${widget.lawyer['category'] ?? ""}',
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(height: 15.h),
            const Divider(
              height: 1,
              thickness: 1.3,
            ),
            SizedBox(height: 15.h),
            FutureBuilder(
                future: calculaterating(
                    list: widget.lawyer['ratings'] ?? [], flg: 1),
                builder: (context, snap) {
                  return CustomText(
                    'Win Prediction : ${snap.data == null ? "100" : snap.data.toString() == "NaN" ? "100" : snap.data}%',
                    color: AppColor.orangeColor,
                    fontSize: 24.sp,
                  );
                }),
            SizedBox(height: 15.h),
            const Divider(
              height: 1,
              thickness: 1.3,
            ),
            SizedBox(height: 15.h),
            // CustomText(
            //   'About',
            //   color: AppColor.orangeColor,
            //   fontSize: 24.sp,
            // ),
            // SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomText(
                    '${widget.lawyer['description'] ?? ""} ',
                    color: AppColor.black,
                    maxLines: 20,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }

  var countrycode = '+92';
  var bookConsulationKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final queryController = TextEditingController();

  bookConsulation() async {
    // var _auth = FirebaseAuth.instance;
    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // BookConsulationModel book = BookConsulationModel();
    // User? user = _auth.currentUser;
    // book.fullName = nameController.text;
    // book.email = emailController.text;
    // book.phone = phoneController.text;
    // book.query = queryController.text;
    // await firebaseFirestore.collection('bookConsulation').doc(user.uid).set(
    //       BookConsulationModel.tomap(),
    //     );

    // Fluttertoast.showToast(
    //   msg: "Your booking request sent Successfuly:)",
    // );
    // // Navigator.pop(context);
    // Get.off(const Home());
  }
}

class BookConsulationModel {
  String? fullName;
  String? email;
  String? phone;
  String? query;

  BookConsulationModel({
    this.fullName,
    this.email,
    this.phone,
    this.query,
  });
  factory BookConsulationModel.fromMap(map) {
    return BookConsulationModel(
      fullName: map['fullName'],
      email: map['email'],
      phone: map['phone'],
      query: map['query'],
    );
  }

//sending
  Map<String, dynamic> tomap() {
    return {
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'query': query,
    };
  }

  static Future<BookConsulationModel> getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDocument = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return BookConsulationModel.fromMap(userDocument.data());
    }
    var guestUser = await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection('userName')
        .get();
    return BookConsulationModel.fromMap(guestUser);
  }
}
