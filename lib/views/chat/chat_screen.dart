import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lawyer/appconstants/RepeatedVarables.dart';
import '../../apis/sendmsg.dart';
import '../../utils/colors.dart';
import '../../widgets/bubble_image.dart';
import '../../widgets/custom_text.dart';
import 'chat_bubble.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  final id;
  ChatScreen({this.id});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  // Type createstate() => ChatScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        title: const Text(
          "Chat with Lawyer",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColor.DARK_GREY,
      ),
      backgroundColor: AppColor.DARK_GREY,
      body: StreamBuilder<DocumentSnapshot>(
          stream: FIRESTORE
              .collection('chats')
              .doc(widget.id)
              .collection(USER_!.uid)
              .doc(USER_?.uid)
              .snapshots(),
          builder: (context, snapshot) {
            var map;
            List<dynamic> cahatlist = [];
            if (snapshot.hasData && snapshot.data?.data() != null) {
              map = snapshot.data?.data() as Map<dynamic, dynamic>;
              cahatlist = map['cahatlist'] ?? [];
            }
            return ListView.builder(
                reverse: true,
                shrinkWrap: true,
                
                itemCount: cahatlist.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChatBubble(
                        senderMe: (widget.id == cahatlist[index]['uid'])
                            ? true
                            : false,
                        message: cahatlist[index]['msg'] ?? "",
                        time: DateFormat('hh:mm a').format(
                            (cahatlist[index]['time']).toDate() ??
                                DateTime.now()),
                        reacted: false,
                      ),

                      // Stack(
                      //   children: <Widget>[
                      //     ListView.builder(
                      //       itemCount: messages.length,
                      //       shrinkWrap: true,
                      //       padding: const EdgeInsets.only(top: 10, bottom: 10),
                      //       physics: const NeverScrollableScrollPhysics(),
                      //       itemBuilder: (context, index) {
                      //         return Container(
                      //           color: const Color.fromARGB(255, 255, 241, 241),
                      //           padding: const EdgeInsets.only(
                      //               left: 14, right: 14, top: 10, bottom: 10),
                      //           child: Align(
                      //             alignment: (messages[index].messageType == "receiver"
                      //                 ? Alignment.topLeft
                      //                 : Alignment.topRight),
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(20),
                      //                 color: (messages[index].messageType == "receiver"
                      //                     ? Colors.white
                      //                     : Colors.red[200]),
                      //               ),
                      //               padding: const EdgeInsets.all(16),
                      //               child: Text(
                      //                 messages[index].messageContent,
                      //                 style: const TextStyle(
                      //                     fontSize: 15, color: Colors.black),
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ],
                      // )
                    ],
                  );
                });
          }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: EdgeInsets.only(left: 17.w, right: 10.w),
            //   child: Container(
            //     height: 30.h,
            //     width: 30.w,
            //     decoration: BoxDecoration(
            //       color: AppColor.Red_COLOR,
            //       borderRadius: BorderRadius.circular(12.r),
            //     ),
            //     child: const Center(
            //       // child: Icon(
            //       //   Icons.add,
            //       //   color: Colors.white,
            //       // ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: enterMessageField(),
            ),
            const SizedBox(width: 3),
            //  Icon(
            //   Icons.mic,
            //   color: AppColor.Red_COLOR,
            //   size: 30,
            // ),
            SizedBox(width: 15.w)
          ],
        ),
      ),
    );
  }

  enterMessageField() {
    var msgcontroller = new TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40.h,
        child: TextField(
          controller: msgcontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.r),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
            suffixIcon: GestureDetector(
              onTap: () async {
                if (msgcontroller.text.trim().isEmpty) return;
                await sendmsg(msg: msgcontroller.text, receiverid: widget.id);
                msgcontroller.text = '';
                setState(() {});
              },
              child: Icon(
                Icons.send,
                color: AppColor.Red_COLOR,
                size: 30,
              ),
            ),
          ),
          style: const TextStyle(color: Colors.black),
          cursorColor: AppColor.Red_COLOR,
        ),
      ),
    );
  }

  circleAvatar(
      {IconData? icon, Color? color, Color? iconColor, double? iconSize}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(200.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 12.h),
        // child: Image(
        //   color: imgColor,
        //   image: AssetImage(img!,),
        // ),
        child: Icon(
          icon!,
          size: iconSize!,
          color: iconColor,
        ),
      ),
    );
  }
}
