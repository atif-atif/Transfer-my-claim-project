import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/models/lawyer_model.dart';
import 'package:lawyer/models/user_model.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/dashboard/Lawyer/detail_page.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_text.dart';
import 'package:lawyer/widgets/custom_text_field.dart';
import 'package:lawyer/widgets/lawyer_categories.dart';

import '../../../apis/calculaterating.dart';
import '../../../appconstants/RepeatedVarables.dart';

class AllLawyers extends StatefulWidget {
  const AllLawyers({super.key});

  @override
  State<AllLawyers> createState() => _AllLawyersState();
}

class _AllLawyersState extends State<AllLawyers> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedinUser = UserModel();
  String selectedcategory = 'Family';
  @override
  void initState() {
    super.initState();
    initvar();
  }

  initvar() async {
    await FIRESTORE
        .collection(ROLE == 'U' ? 'users' : "lawyers")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedinUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  callback({value}) {
    selectedcategory = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   label: const Text('Location'),
      //   backgroundColor: AppColor.ORANGE_COLOR,
      //   onPressed: () {
      //     Get.dialog(
      //       Center(
      //         child: Card(
      //           color: AppColor.DARK_GREY,
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 15.w),
      //             child: Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 SizedBox(height: 15.h),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.end,
      //                   children: [
      //                     GestureDetector(
      //                       onTap: () {
      //                         Get.back();
      //                       },
      //                       child: const CircleAvatar(
      //                         backgroundColor: AppColor.ORANGE_COLOR,
      //                         radius: 12,
      //                         child: Icon(
      //                           Icons.close_rounded,
      //                           size: 20,
      //                           color: Colors.white,
      //                         ),
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //                 SizedBox(height: 40.h),
      //                 CustomTextFormField(
      //                   'Enter City Name',
      //                   prefixIcon: Icons.search,
      //                   controller: searchController,
      //                 ),
      //                 SizedBox(height: 40.h),
      //                 CustomButton(
      //                   text: 'Continue',
      //                   color: AppColor.ORANGE_COLOR,
      //                   action: () {
      //                     Get.back();
      //                   },
      //                 ),
      //                 SizedBox(height: 25.h),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      //   icon: const Icon(Icons.location_history_outlined),
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            CustomText(
              'Choose a Category',
              color: Colors.black,
            ),
            SizedBox(height: 12.h),
            LawyerCategories(callback: callback),
            SizedBox(height: 12.h),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('lawyers')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  List<DocumentSnapshot> lawyerlist = [];
                  if (snapshot.hasData && snapshot.data != null) {
                    lawyerlist = snapshot.data?.docs as List<DocumentSnapshot>;
                  }
                  return snapshot.hasError
                      ? CustomText('Error: ${snapshot.error}')
                      : snapshot.connectionState == ConnectionState.waiting
                          ? const Center(child: CircularProgressIndicator())
                          // : ListTile(
                          //   title: CustomText(document. ['userName']),
                          // )
                          : ListView.separated(
                              shrinkWrap: true,
                              controller: ScrollController(),
                              scrollDirection: Axis.vertical,
                              itemCount: lawyerlist.length,
                              itemBuilder: (ctx, index) {
                                var map = lawyerlist[index].data()
                                    as Map<dynamic, dynamic>;
                                print(
                                    "*****************************************");
                                print(lawyerlist[index]);
                                print(
                                    "*****************************************");
                                return (map['category']
                                            .toString()
                                            .toLowerCase() !=
                                        selectedcategory
                                            .toString()
                                            .toLowerCase())
                                    ? Container(
                                        color: AppColor.DARK_GREY,
                                      )
                                    : (map['enableflg'] == false)
                                        ? const Text("")
                                        : Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                      map['image'] ?? "",
                                                      height: 75.h,
                                                      width: 70.w,
                                                      fit: BoxFit.cover,
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace?
                                                                  stackTrace) {
                                                    return const Icon(
                                                      Icons.person,
                                                      size: 70,
                                                      color: Colors.black,
                                                    );
                                                  }, loadingBuilder: (BuildContext
                                                              context,
                                                          Widget child,
                                                          ImageChunkEvent?
                                                              loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        value: loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                loadingProgress
                                                                    .expectedTotalBytes!
                                                            : null,
                                                      ),
                                                    );
                                                  }),
                                                ),

                                                // Image(
                                                //   height: 75.h,
                                                //   width: 70.w,
                                                //   image: AssetImage(
                                                //       map['image']??""),
                                                // ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                      map['userName'] ??
                                                          map["firstName"],
                                                      // '${loggedinUser.userName}',

                                                      // '${UserModel.getCurrentUser()}',
                                                      // lawyerContent[index].title!,
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    ),
                                                    SizedBox(height: 7.h),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on,
                                                          size: 16,
                                                          color: AppColor
                                                              .ORANGE_COLOR,
                                                        ),
                                                        CustomText(
                                                          map['city'] ?? "",
                                                          color: Colors.grey,
                                                          fontSize: 12,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .star_rate_rounded,
                                                          size: 16,
                                                          color: AppColor
                                                              .ORANGE_COLOR,
                                                        ),
                                                        FutureBuilder(
                                                            future: calculaterating(
                                                                list:
                                                                    map['ratings'] ??
                                                                        [],
                                                                flg: 1),
                                                            builder: (context,
                                                                snap) {
                                                              return CustomText(
                                                                " ${snap.data == null ? 100 : snap.data.toString() == "NaN" ? 100 : snap.data}%",
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 12,
                                                              );
                                                            }),
                                                      ],
                                                    ),
                                                    SizedBox(height: 7.h),
                                                  ],
                                                ),
                                              ),
                                              if (ROLE == 'U')
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.to(LawyerDetailScreen(
                                                        lawyer: map));
                                                  },
                                                  child: Container(
                                                    height: 40.h,
                                                    width: 100.w,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color:
                                                          AppColor.ORANGE_COLOR,
                                                    ),
                                                    child: Center(
                                                      child: CustomText(
                                                        'Consult Now',
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          );
                              },
                              separatorBuilder: (BuildContext ctx, int index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
