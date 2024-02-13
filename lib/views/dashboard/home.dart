import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../apis/calculaterating.dart';
import '../../apis/get_user.dart';
import '../../appconstants/RepeatedVarables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer/controllers/choose_role_controller.dart';
import 'package:lawyer/models/user_model.dart';
import 'package:lawyer/utils/asset_path.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/actions/ask_me_anything.dart';
import 'package:lawyer/widgets/chatBot.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer/widgets/custom_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      floatingActionButton: chatBot,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Row(
              children: [
                SizedBox(width: 15.w),
                CustomText(
                  'Hey! ',
                  fontSize: 22.sp,
                  color: AppColor.black,
                ),
                CustomText(
                  ROLE == 'U'
                      ? User_role
                      : ROLE == 'L'
                          ? Lawyer_role
                          : Admin_role,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: ROLE == 'U'
                      ? Colors.green
                      : ROLE == 'L'
                          ? Colors.red
                          : Colors.blue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomText(
                    loggedinUser.userName ?? "",
                    color: AppColor.orangeColor,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection(ROLE == "L" ? 'lawyerbooked' : "hiredbyusers")
                  .doc(USER_?.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                List<dynamic> lawyerlist = [];
                if (snapshot.hasData && snapshot.data?.data() != null) {
                  var map = snapshot.data?.data() as Map<dynamic, dynamic>;
                  lawyerlist = map['bookings'];
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
                              return FutureBuilder(
                                future: get_user(lawyerlist[index]['uid']),
                                builder: (context, snap) {
                                  return snap.data == null
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: CustomText(
                                                ROLE == "U"
                                                    ? 'No Accepted Cases'
                                                    : ROLE == "L"
                                                        ? 'No Opened Cases Yet\n if case is opened\n it will show here'
                                                        : 'No Requests Yet',
                                                color: AppColor.black,
                                                maxLines: 20,
                                                fontSize: 28,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        )
                                      : Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w),
                                          child: Row(
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
                                                      snap.data['image'] ?? "",
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
                                                    if (loadingProgress == null)
                                                      return child;
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
                                                      snap.data['userName'] ??
                                                          "",
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
                                                          snap.data['city'] ??
                                                              "",
                                                          color: Colors.grey,
                                                          fontSize: 12,
                                                        ),
                                                      ],
                                                    ),
                                                    if (ROLE == 'U')
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
                                                                  list: snap.data[
                                                                          'ratings'] ??
                                                                      [],
                                                                  flg: 1),
                                                              builder: (context,
                                                                  snap2) {
                                                                return CustomText(
                                                                  " ${snap2.data == null ? 100 : snap2.data.toString() == "NaN" ? 100 : snap2.data}%",
                                                                  color: Colors
                                                                      .grey,
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
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                            builder:
                                                                (context, set) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Confirm!'),
                                                            content: SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height /
                                                                  4,
                                                              child: Column(
                                                                children: [
                                                                  const Text(
                                                                      'If you are agree, you can give rating to the lawyer and press confirm otherwise you can cancel this case!'),
                                                                  customrating(
                                                                      setstatefun:
                                                                          setstatefun),
                                                                ],
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  var doc = FIRESTORE
                                                                      .collection(
                                                                          'lawyerbooked')
                                                                      .doc(snap
                                                                              .data[
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
                                                                  var value;
                                                                  requests
                                                                      .forEach(
                                                                          (d) {
                                                                    if (d['requestnumber'] ==
                                                                        lawyerlist[index]
                                                                            [
                                                                            'requestnumber'])
                                                                      ;
                                                                    value = d;
                                                                  });

                                                                  requests.removeWhere((element) =>
                                                                      element[
                                                                          'requestnumber'] ==
                                                                      value[
                                                                          'requestnumber']);

                                                                  await doc
                                                                      .set({
                                                                    'bookings':
                                                                        FieldValue.arrayUnion(
                                                                            requests)
                                                                  });

                                                                  var doc2 = FIRESTORE
                                                                      .collection(
                                                                          'hiredbyusers')
                                                                      .doc(USER_
                                                                          ?.uid);
                                                                  List<dynamic>
                                                                      listu =
                                                                      [];
                                                                  var data2 =
                                                                      await doc2
                                                                          .get();
                                                                  listu = data2
                                                                          .data()![
                                                                      'bookings'];
                                                                  listu.removeWhere((element) =>
                                                                      element[
                                                                          'requestnumber'] ==
                                                                      value[
                                                                          'requestnumber']);
                                                                  await doc2
                                                                      .set({
                                                                    'bookings':
                                                                        FieldValue.arrayUnion(
                                                                            listu)
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child: Container(
                                                                    color: Colors
                                                                        .blue,
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            .5),
                                                                    child: const Text(
                                                                        'Cancel Case')),
                                                              ),
                                                              GestureDetector(
                                                                onTap:
                                                                    () async {
                                                                  print(rat);
                                                                  await FIRESTORE
                                                                      .collection(
                                                                          'lawyers')
                                                                      .doc(snap
                                                                              .data[
                                                                          'uid'])
                                                                      .update({
                                                                    'ratings':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      rat
                                                                    ])
                                                                  });
                                                                  var doc = FIRESTORE
                                                                      .collection(
                                                                          'lawyerbooked')
                                                                      .doc(snap
                                                                              .data[
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
                                                                  var value;
                                                                  requests
                                                                      .forEach(
                                                                          (d) {
                                                                    if (d['requestnumber'] ==
                                                                        lawyerlist[index]
                                                                            [
                                                                            'requestnumber'])
                                                                      ;
                                                                    value = d;
                                                                  });

                                                                  requests.removeWhere((element) =>
                                                                      element[
                                                                          'requestnumber'] ==
                                                                      value[
                                                                          'requestnumber']);
                                                                  value['status'] =
                                                                      true;
                                                                  requests.add(
                                                                      value);
                                                                  await doc
                                                                      .set({
                                                                    'bookings':
                                                                        FieldValue.arrayUnion(
                                                                            requests)
                                                                  });

                                                                  var doc2 = FIRESTORE
                                                                      .collection(
                                                                          'hiredbyusers')
                                                                      .doc(USER_
                                                                          ?.uid);
                                                                  List<dynamic>
                                                                      listu =
                                                                      [];
                                                                  var data2 =
                                                                      await doc2
                                                                          .get();
                                                                  listu = data2
                                                                          .data()![
                                                                      'bookings'];
                                                                  listu.removeWhere((element) =>
                                                                      element[
                                                                          'requestnumber'] ==
                                                                      value[
                                                                          'requestnumber']);
                                                                  await doc2
                                                                      .set({
                                                                    'bookings':
                                                                        FieldValue.arrayUnion(
                                                                            listu)
                                                                  });
                                                                  if (mounted)
                                                                    setState(
                                                                        () {});
                                                                  Fluttertoast
                                                                      .showToast(
                                                                    gravity:
                                                                        ToastGravity
                                                                            .CENTER,
                                                                    toastLength:
                                                                        Toast
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
                                                                        const EdgeInsets.all(
                                                                            .5),
                                                                    child: const Text(
                                                                        'Confirm')),
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                      },
                                                    );
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
                                                        'Take actions',
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        );
                                },
                              );
                            },
                            separatorBuilder: (BuildContext ctx, int index2) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Divider(
                                  height: 1.h,
                                  color: Colors.grey,
                                  thickness: 1.h,
                                ),
                              );
                            },
                          );
              },
            ),
          ],
        ),
      ),
    );
  }

  final chooseRoleController = Get.put(ChooseRoleController());
  String User_role = 'User';
  String Lawyer_role = 'Lawyer';
  String Admin_role = 'Admin';

  UserModel loggedinUser = UserModel();

  @override
  void initState() {
    super.initState();
    initvar();
  }

  Future<void> initvar() async {
    await FirebaseFirestore.instance
        .collection((ROLE == 'U')
            ? "users"
            : (ROLE == 'L')
                ? "lawyers"
                : "admin")
        .doc(USER_?.uid)
        .get()
        .then((value) {
      loggedinUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  void setstatefun() {
    setState(() {});
  }
}

List<LegalServiceModule> moduleList = [
  LegalServiceModule(
    'Bare Acts',
    AssetPath.COURT,
    () {},
  ),
  LegalServiceModule(
    'Lawyer Registration',
    AssetPath.WRITE,
    () {},
  ),
  LegalServiceModule(
    'Blogs',
    AssetPath.BLOGS,
    () {},
  ),
  LegalServiceModule(
    'Ask Me Anything',
    AssetPath.guestBlogging,
    () {
      Get.to(const AskMeAnything());
    },
  ),
  LegalServiceModule(
    'Bare Acts',
    AssetPath.COURT,
    () {},
  ),
  LegalServiceModule(
    'Lawyer Registration',
    AssetPath.WRITE,
    () {},
  ),
  LegalServiceModule(
    'Blogs',
    AssetPath.BLOGS,
    () {},
  ),
  LegalServiceModule(
    'Ask Me Anything',
    AssetPath.guestBlogging,
    () {
      Get.to(const AskMeAnything());
    },
  ),
  LegalServiceModule(
    'Bare Acts',
    AssetPath.COURT,
    () {},
  ),
  LegalServiceModule(
    'Lawyer Registration',
    AssetPath.WRITE,
    () {},
  ),
  LegalServiceModule(
    'Blogs',
    AssetPath.BLOGS,
    () {},
  ),
  LegalServiceModule(
    'Ask Me Anything',
    AssetPath.guestBlogging,
    () {
      Get.to(const AskMeAnything());
    },
  ),
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

var rat = 0.0;

class customrating extends StatefulWidget {
  final setstatefun;

  customrating({this.setstatefun});

  @override
  State<customrating> createState() => _customratingState();
}

class _customratingState extends State<customrating> {
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      onRated: (rat) {
        rat = rat;
        print(rat);

        setState(() {});
      },
      allowHalfRating: false,
      starCount: 5,
      rating: rat,
      size: 23.0,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.blur_on,
      color: AppColor.orangeColor,
      borderColor: AppColor.orangeColor,
      spacing: 0.0,
    );
  }
}
