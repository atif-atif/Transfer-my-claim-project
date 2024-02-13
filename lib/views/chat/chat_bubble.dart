import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../../widgets/custom_text.dart';


class ChatBubble extends StatelessWidget {
  final bool? senderMe;
  final String? userImg;
  final String message;
  final IconData? emoj;
  final String time;
  final IconData? read;
  final bool reacted;
  final bool? isMessageLast;
  final bool? isMessageRecent;

  const ChatBubble({
    this.senderMe = false,
    this.userImg = "",
    required this.message,
    this.emoj = Icons.favorite,
    required this.time,
    this.read = Icons.done_all,
    this.reacted = false,
    this.isMessageLast = false,
    this.isMessageRecent = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    senderMe == false
                        // edher e ho boss?????????????????????????????????????
                        ? Container(
                            height: 40.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Image.asset(""),
                          )
                        : const Expanded(
                            child: SizedBox(),
                          ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 3,
                      child: Container(
                        // selected: false,
                        // onValueChanged: (value) {},
                        decoration: BoxDecoration(
                          color: senderMe == true
                              ? Colors.grey
                              : Colors.black,
                          border: Border.all(color: Colors.transparent),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                              senderMe == false ? 0 : 28.r,
                            ),
                            topRight: Radius.circular(28.r),
                            bottomRight: Radius.circular(
                              senderMe == false ? 28.r : 0,
                            ),
                            topLeft: Radius.circular(28.r),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 18.w, right: 15.w, top: 12.h, bottom: 10.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CustomText(
                                       message,
                                      color: senderMe == true
                                          ? Colors.black
                                          : Colors.black,
                                      overflow: TextOverflow.fade,
                                      maxLines: 300,
                                    ),
                                  ),
                                ],
                              ),
                              isMessageRecent == true
                                  ? const SizedBox()
                                  : CustomText(
                                     time,
                                      color: senderMe == true
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    senderMe == false
                        ? isMessageLast == true
                            ? Icon(read, color: Colors.green)
                            : const SizedBox()
                        : const SizedBox(),
                    senderMe == false
                        ? SizedBox(width: 30.w)
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
            reacted == true
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 65.h,
                        left: senderMe == true ? 0 : 130.w,
                        right: senderMe == false ? 0 : 80.w,
                      ),
                      child: FloatingActionButton.small(
                        backgroundColor: Colors.black,
                        onPressed: () {},
                        child: Icon(
                          emoj,
                          color: AppColor.Red_COLOR,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
