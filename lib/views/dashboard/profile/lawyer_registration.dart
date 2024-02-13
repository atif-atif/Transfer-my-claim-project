import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lawyer/views/dashboard/Lawyer/book_consultation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/language_picker_dropdown_controller.dart';
import 'package:language_picker/languages.dart';
import 'package:lawyer/models/user_model.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/auth/registration.dart';
import 'package:lawyer/views/dashboard/profile/pick_image.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_dropdown.dart';
import 'package:lawyer/widgets/custom_text.dart';
import 'package:lawyer/widgets/custom_text_field.dart';
import 'package:country_state_city_pickers/country_state_city_pickers.dart';

import '../../../apis/set_profile.dart';
import '../../../appconstants/RepeatedVarables.dart';

class RegisterAsLawyer extends StatefulWidget {
  const RegisterAsLawyer({super.key});

  @override
  State<RegisterAsLawyer> createState() => _RegisterAsLawyerState();
}

class _RegisterAsLawyerState extends State<RegisterAsLawyer> {
  User? user = FirebaseAuth.instance.currentUser;
  var image = '';
  UserModel loggedinUser = UserModel();
  var _picker = ImagePicker();
  var imagefile;
  @override
  void initState() {
    super.initState();
    initvariables();
  }

  initvariables() async {
    print("jffjjfjfjfj");
    await FIRESTORE
        .collection(ROLE == 'U' ? 'users' : "lawyers")
        .doc(USER_?.uid)
        .get()
        .then((value) {
      print(value.data());
      USER_PROFILE = value.data();
      loggedinUser = UserModel.fromMap(value.data());
      firstNameController.text = loggedinUser.firstName ?? "";
      lastNameController.text = loggedinUser.lastName ?? "";
      nameController.text = loggedinUser.userName ?? "";
      emailController.text = loggedinUser.email ?? "";
      specialityController.text = loggedinUser.specialities ?? "";
      qualificationController.text = loggedinUser.qualification ?? "";
      image = loggedinUser.image ?? "";

      setState(() {});
    });
  }

  var imageurl = '';
  @override
  Widget build(BuildContext context) {
    final _lawyerFormKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      'Kindly Fill the information below, To get all features of this app',
                      maxLines: 5,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              SizedBox(
                height: 125,
                width: 125,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Imagepickerchoicedialog();
                      },
                      child: Center(
                        child: Container(
                          height: 110.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              width: 2,
                              color: AppColor.ORANGE_COLOR,
                            ),
                          ),
                          child: Center(
                              child: Image.network(image,
                                  height: 70.h, width: 70.w, fit: BoxFit.cover,
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                            return const Icon(
                              Icons.person,
                              size: 70,
                              color: Colors.black,
                            );
                          }, loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          })),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: AppColor.DARK_GREY,
                        child: CircleAvatar(
                          radius: 19,
                          backgroundColor: AppColor.ORANGE_COLOR,
                          child: GestureDetector(
                            onTap: () {
                              Imagepickerchoicedialog();
                            },
                            child: const Icon(
                              Icons.camera_alt_outlined,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Form(
                key: _lawyerFormKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      'First Name',
                      prefixIcon: Icons.person,
                      controller: firstNameController,
                    ),
                    CustomTextFormField(
                      'Last Name',
                      prefixIcon: Icons.email,
                      controller: lastNameController,
                    ),

                    CustomTextFormField(
                      'Phone Number',
                      keyboardType: TextInputType.phone,
                      prefixIconWidget: CountryCodePicker(
                        textStyle:
                            const TextStyle(color: AppColor.ORANGE_COLOR),
                        closeIcon: const Icon(Icons.arrow_drop_down),
                        initialSelection: 'PK',
                        favorite: const ['PK', '+92'],
                        showCountryOnly: true,
                        onChanged: (value) {
                          setState(() {
                            countrycode = value.toString();
                          });
                        },
                      ),
                      controller: numberController,
                    ),
                    CustomTextFormField(
                      'Year of Experience',
                      prefixIcon: Icons.person_add_alt,
                      controller: experienceController,
                    ),
                    CustomTextFormField(
                      'Qualification',
                      prefixIcon: Icons.handshake,
                      controller: qualificationController,
                    ),
                    CustomDropDown(
                      label: 'Speciality',
                      items: [
                        'Family',
                        'Property',
                        'Busines',
                        'Criminal',
                        'Family',
                        'Taxation',
                      ],
                    ),
                    CustomTextFormField(
                      'Specialities',
                      prefixIcon: Icons.folder_special,
                      controller: specialityController,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: CountryStateCityPicker(
                        boxWidth: double.infinity.w,
                        initialCountry: '🇵🇰Pakistan',
                        onCountryChanged: (val) {
                          countryValue = val;
                        },
                        onCityChanged: (value) {
                          cityValue = value;
                        },
                        onStateChanged: (value) {
                          stateValue = value;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: LanguagePickerDropdown(
                        initialValue: Languages.urdu,
                        itemBuilder: _buildDropdownItem,
                        onValuePicked: (Language language) {
                          _selectedDropdownLanguage = language;
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    // CustomTextFormField(
                    //   'Lawyer ID',
                    //   prefixIcon: Icons.contact_page_sharp,
                    //   controller: lastNameController,
                    // ),
                    CustomTextFormField(
                      'Profile Description',
                      controller: descriptionController,
                      // hintText:
                      //     'Shah Rasool is an advocate practicing in Pune. He has 4 years of practicial experience. He studied LLB from abc college. Got LLM in 2016. Currently specialises in handling Civil Cases. He also handles Family Cases. He practices at Pune District Court and Other Subordinate Coursts.',
                      minLines: 7,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                width: Get.width * 0.6,
                color: Colors.black,
                textColor: Colors.white,
                isSecondaryButton: true,
                text: 'Submit',
                action: () async {
                  profileSubmitAction();
                },
              ),
              SizedBox(height: 75.h),
            ],
          ),
        ),
      ),
    );
  }

  // final _auth = FirebaseAuth.instance;
  // submitAction() async {
  //   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   UserModel userModel = UserModel();
  //   User? user = _auth.currentUser;
  //   // userModel.fullName = fullNameController.text;
  //   // userModel.lawyerCity = lawyerCityController.text;
  //   userModel.email = user!.email;
  //   userModel.uid = user.uid;
  //   await firebaseFirestore.collection('users').doc(user.uid).set(
  //         userModel.tomap(),
  //       );

  //   Fluttertoast.showToast(
  //     msg: "Profile Updated)",
  //   );
  // }

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  var countrycode = '+92';
  final numberController = TextEditingController();
  final experienceController = TextEditingController();
  final qualificationController = TextEditingController();
  final specialityController = TextEditingController();
  final descriptionController = TextEditingController();

  String? countryValue;
  String? stateValue;
  String? cityValue;

  final languageController =
      LanguagePickerDropdownController(Languages.english);
  Language _selectedDropdownLanguage = Languages.english;
  Widget _buildDropdownItem(Language language) {
    return Row(
      children: <Widget>[
        const SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})"),
      ],
    );
  }

  profileSubmitAction() async {
    showcirculer(context);

    UserModel userModel = UserModel();
    User? user = USER_;
    userModel.userName = firstNameController.text;
    userModel.lastName = lastNameController.text;
    userModel.phoneNumber = numberController.text;
    userModel.experience = experienceController.text;
    userModel.qualification = qualificationController.text;
    userModel.specialities = specialityController.text;
    userModel.description = descriptionController.text;
    userModel.country = countryValue.toString();
    userModel.state = stateValue.toString();
    userModel.city = cityValue.toString();
    userModel.language = languageController.toString();
    userModel.email = user!.email;
    userModel.uid = user.uid;
    await set_profile(
        file: imagefile,
        image: USER_PROFILE['image'] ?? "",
        name: userModel.userName,
        experience: userModel.experience,
        phoneNumber: userModel.phoneNumber,
        firstName: userModel.firstName,
        lastName: userModel.lastName,
        description: userModel.description,
        qualification: userModel.qualification,
        specialities: userModel.specialities,
        city: userModel.city);

    Navigator.pop(context);
  }

  // showConfirmLogout() {
  //   showCupertinoModalPopup(
  //     context: context,
  //     builder: (context) => CupertinoActionSheet(
  //       message: const Text("Would you like to sign out?"),
  //       actions: [
  //         CupertinoActionSheetAction(
  //           onPressed: () {
  //             // Get.to(Sign_In());
  //           },
  //           child: const Text(
  //             "Sign Out",
  //             style: TextStyle(color: Colors.red),
  //           ),
  //         )
  //       ],
  //       cancelButton: CupertinoActionSheetAction(
  //         child: const Text("Cancel"),
  //         onPressed: () {
  //           // Navigator.of(context).pop();
  //         },
  //       ),
  //     ),
  //   );
  // }
  Imagepickerchoicedialog() {
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: AppColor.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              color: AppColor.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: GestureDetector(
                    onTap: () async {
                      await Permission.photos.request();
                      var photo;

                      photo =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (photo != null) {
                        setState(() {});
                        imagefile = File(photo.path);
                      }
                      await set_profile(
                          file: imagefile,
                          image: USER_PROFILE['image'] ?? "",
                          name: USER_PROFILE['userName'] ?? "",
                          experience: USER_PROFILE['experience'] ?? "",
                          phoneNumber: USER_PROFILE['phoneNumber'] ?? "",
                          firstName: USER_PROFILE['firstName'] ?? "",
                          lastName: USER_PROFILE['lastName'] ?? "",
                          qualification: USER_PROFILE['qualification'] ?? "",
                          specialities: USER_PROFILE['specialities'] ?? "");
                      await initvariables();
                      if (mounted) setState(() {});
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/gallery.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                SizedBox(
                    width: 60,
                    height: 55,
                    child: GestureDetector(
                        onTap: () async {
                          await Permission.camera.request();
                          var photo;

                          photo = await _picker.pickImage(
                              source: ImageSource.camera);

                          if (photo != null) {
                            imagefile = File(photo.path);
                          }
                          await set_profile(
                              file: imagefile,
                              image: USER_PROFILE['image'] ?? "",
                              name: USER_PROFILE['userName'] ?? "",
                              experience: USER_PROFILE['experience'] ?? "",
                              phoneNumber: USER_PROFILE['phoneNumber'] ?? "",
                              firstName: USER_PROFILE['firstName'] ?? "",
                              lastName: USER_PROFILE['lastName'] ?? "",
                              qualification:
                                  USER_PROFILE['qualification'] ?? "",
                              specialities: USER_PROFILE['specialities'] ?? "");
                          await initvariables();
                          if (mounted) setState(() {});
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/camera.png",
                          fit: BoxFit.fill,
                        ))),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}
