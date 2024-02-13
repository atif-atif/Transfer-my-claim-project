import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/widgets/custom_button.dart';
import 'package:lawyer/widgets/custom_text.dart';
import 'package:lawyer/widgets/custom_text_field.dart';

import '../../../apis/bookconsultant.dart';

class ConsultationBooking extends StatefulWidget {
  final lawyer;
   ConsultationBooking({this.lawyer});

  @override
  State<ConsultationBooking> createState() => _ConsultationBookingState();
}

class _ConsultationBookingState extends State<ConsultationBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      appBar: AppBar(
        leading: const BackButton(
          color: AppColor.black,
        ),
        backgroundColor: AppColor.black,
        title: const Text(
          'Book Your Consultation',
          style: TextStyle(
            color: AppColor.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: bookConsulationKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      'Your Full Name',
                      prefixIcon: Icons.person,
                      controller: nameController,
                    ),
                    SizedBox(height: 25.h),
                    CustomTextFormField(
                      'Your Email',
                      prefixIcon: Icons.email,
                      controller: emailController,
                    ),
                    SizedBox(height: 25.h),
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
                          // setState(() {
                          countrycode = value.toString();
                          // });
                        },
                      ),
                      controller: phoneController,
                    ),
                    SizedBox(height: 25.h),
                    CustomTextFormField(
                      'Your Query',
                      controller: queryController,
                      minLines: 5,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.h),
            CustomButton(
              width: Get.width * 0.6,
              color: AppColor.orangeColor,
              isSecondaryButton: true,
              text: 'Submit',
              action: () async {
               await bookconsultant(lawyerid:widget.lawyer['uid'],phone:countrycode+phoneController.text,uname: nameController.text,email: emailController.text,query:queryController.text);
              },
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
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
