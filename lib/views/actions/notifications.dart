import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/widgets/CustomContainer.dart';
import 'package:lawyer/widgets/custom_text.dart';
import '../../apis/bookconsultant.dart';
import '../../apis/getlawyer.dart';
import '../../apis/gtlayer.dart';
import '../../appconstants/RepeatedVarables.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey400,
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        backgroundColor: AppColor.grey400,
        leading: const BackButton(
          color: AppColor.black,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Notifications',
              style: TextStyle(
                color: AppColor.black,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 20.h),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     CustomText(
              //       'Requests',
              //       color: Colors.black,
              //       fontSize: 35,
              //     ),
              //   ],
              // ),
              if (ROLE != 'A')
                StreamBuilder<DocumentSnapshot>(
                    stream: FIRESTORE
                        .collection(
                            ROLE == 'L' ? 'lawyersrequests' : "users_requests")
                        .doc(USER_?.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      var map;
                      List<dynamic> ids = [];
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasData && snapshot.data?.data() != null) {
                        map = snapshot.data?.data() as Map<dynamic, dynamic>;
                        print(map);
                        ids = map['bookings'] ?? [];
                      }
                      return (ids.isEmpty)
                          ? const Center(
                              child: Text(
                                "No request found!!",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          : ListView.builder(
                              itemCount: ids.length,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, i) => FutureBuilder(
                                  future: getlawyer(ids[i]['uid']),
                                  builder: (context, shot) {
                                    return (shot.data?.data() == null)
                                        ? const Text("")
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h),
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (ROLE != 'U') {
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Confirm!'),
                                                          content: const Text(
                                                              'Are you agree?'),
                                                          actions: <Widget>[
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .blue,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          .5),
                                                                  child: const Text(
                                                                      'Cancel')),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () async {
                                                                await bookconsultant(
                                                                    lawyerid:
                                                                        USER_
                                                                            ?.uid,
                                                                    uid: ids[i]
                                                                        ['uid'],
                                                                    flg: 1);
                                                                ids.remove(
                                                                    ids[i]);
                                                                await FIRESTORE
                                                                    .collection(
                                                                        'lawyersrequests')
                                                                    .doc(USER_
                                                                        ?.uid)
                                                                    .set({
                                                                  'bookings':
                                                                      FieldValue
                                                                          .arrayUnion(
                                                                              ids)
                                                                });
                                                                var doc = FIRESTORE
                                                                    .collection(
                                                                        'users_requests')
                                                                    .doc(ids[i][
                                                                        'uid']);
                                                                List<dynamic>
                                                                    requests =
                                                                    [];
                                                                var data =
                                                                    await doc
                                                                        .get();
                                                                requests = data
                                                                            .data()![
                                                                        'bookings']
                                                                    as List<
                                                                        dynamic>;

                                                                requests.remove(
                                                                    USER_?.uid);

                                                                await doc.set({
                                                                  'bookings': FieldValue
                                                                      .arrayUnion(
                                                                          requests)
                                                                });

                                                                if (mounted) {
                                                                  setState(
                                                                      () {});
                                                                }
                                                                Fluttertoast
                                                                    .showToast(
                                                                  gravity:
                                                                      ToastGravity
                                                                          .CENTER,
                                                                  toastLength: Toast
                                                                      .LENGTH_LONG,
                                                                  msg:
                                                                      "Successfully confirmed!!",
                                                                );
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Container(
                                                                  color: Colors
                                                                      .blue,
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          .5),
                                                                  child: const Text(
                                                                      'Confirm')),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: CustomContainer(
                                                  borderwidth: 1,
                                                  color: AppColor.DARK_GREY,
                                                  circularRadius: 20.r,
                                                  width: double.infinity,
                                                  child: box(shot.data,
                                                      requestdata: ids[i]),
                                                ),
                                              ),
                                            ),
                                          );
                                  }),
                            );
                    }),
              if (ROLE == 'A')
                StreamBuilder<QuerySnapshot>(
                    stream: FIRESTORE.collection('requests').snapshots(),
                    builder: (context, snapshot) {
                      var map;
                      List<DocumentSnapshot> ids = [];
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      if (snapshot.hasData && snapshot.data != null) {
                        ids = snapshot.data?.docs as List<DocumentSnapshot>;
                      }
                      return (ids.isEmpty)
                          ? const Center(
                              child: Text(
                                "No request found!!",
                                style: TextStyle(color: Colors.black),
                              ),
                            )
                          : ListView.builder(
                              itemCount: ids.length,
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemBuilder: (context, i) => FutureBuilder(
                                  future: getadminlawyer(ids[i].id),
                                  builder: (context, shot) {
                                    return (shot.data?.data() == null)
                                        ? const Text("")
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h),
                                              child: GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Dialog Title'),
                                                        content: const Text(
                                                            'This is the content of the dialog.'),
                                                        actions: <Widget>[
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                                color:
                                                                    Colors.blue,
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        .5),
                                                                child: const Text(
                                                                    'Cancel')),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () async {
                                                              var doc = await FIRESTORE
                                                                  .collection(
                                                                      'lawyers')
                                                                  .doc(shot
                                                                      .data?.id)
                                                                  .get();
                                                              var flg = false;
                                                              flg = doc.data()![
                                                                  'enableflg'];
                                                              await FIRESTORE
                                                                  .collection(
                                                                      'lawyers')
                                                                  .doc(shot
                                                                      .data?.id)
                                                                  .update({
                                                                'enableflg':
                                                                    flg == true
                                                                        ? false
                                                                        : true
                                                              });
                                                              if (mounted) {
                                                                setState(() {});
                                                              }
                                                              Fluttertoast
                                                                  .showToast(
                                                                gravity:
                                                                    ToastGravity
                                                                        .CENTER,
                                                                toastLength: Toast
                                                                    .LENGTH_LONG,
                                                                msg:
                                                                    "Successfully ${flg == true ? "lawyer disabled" : "Enable"}",
                                                              );
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                                color:
                                                                    Colors.blue,
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        .5),
                                                                child: const Text(
                                                                    'Confirm')),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: CustomContainer(
                                                  borderwidth: 1,
                                                  color: AppColor.DARK_GREY,
                                                  circularRadius: 20.r,
                                                  width: double.infinity,
                                                  child: box(shot.data),
                                                ),
                                              ),
                                            ),
                                          );
                                  }),
                            );
                    }),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  box(data, {requestdata}) {
    // var category = 'Category';
    // var lawyer = 'Lawyer Name';
    // var status = 'Pending or confirmed';
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customRow(
              '${ROLE == "L" ? "User" : ROLE == "U" ? "Lawyer" : "Lawyer"}  Name:',
              data.data()['userName'] ?? ""),
          if (ROLE == "A")
            customRow('Category:        ', data.data()['category'] ?? ""),
          if (ROLE == "A")
            customRow('Status:             ',
                data.data()['enableflg'] == false ? "Pending" : 'Approved'),
          if (ROLE != "A") customRow('Status:             ', "Pending"),
          SizedBox(height: 20.h),
          if (ROLE == 'L')
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "query",
                        color: AppColor.orangeColor,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(requestdata['query'] ?? ""),
                    ],
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }

  customRow(String name, String field) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                name,
                color: AppColor.orangeColor,
                fontSize: 18,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(field),
            ],
          ),
        ),
      ],
    );
  }
}
