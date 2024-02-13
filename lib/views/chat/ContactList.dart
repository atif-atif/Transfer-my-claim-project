import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawyer/apis/get_user.dart';
import 'package:lawyer/utils/colors.dart';
import 'package:lawyer/views/chat/chat_time.dart';
import 'package:lawyer/widgets/custom_text.dart';

import '../../appconstants/RepeatedVarables.dart';
import 'chat_screen.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.DARK_GREY,
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          "Contacts",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: AppColor.DARK_GREY,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: StreamBuilder<DocumentSnapshot>(
            stream:
                FIRESTORE.collection('contacts').doc(USER_?.uid).snapshots(),
            builder: (context, snapshot) {
              var map;
              List<dynamic> contactlist = [];
              if (snapshot.hasData && snapshot.data?.data() != null) {
                map = snapshot.data?.data() as Map<dynamic, dynamic>;

                contactlist = map['contactslist'] ?? [];
              }
              ("llllllllllllllllllllllllllllllllllllllllllllllll");
              (contactlist);
              ("llllllllllllllllllllllllllllllllllllllllllllllll");
              return (map == null)
                  ? const Text("")
                  : SizedBox.expand(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: contactlist.length,
                        itemBuilder: (context, index) {
                          return FutureBuilder(
                            future: get_user(contactlist[index]),
                            builder: (context, shot) {
                              var map2;
                              if (shot.data != null) map2 = shot.data;
                              return map2 == null
                                  ? const Text("")
                                  : GestureDetector(
                                      onTap: () {
                                        Get.to(() =>
                                            ChatScreen(id: contactlist[index]));
                                      },
                                      child: Card(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: Image.network(
                                                map2['image'] ?? "",
                                                height: 70,
                                                width: 70,
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return const Icon(
                                                    Icons.person,
                                                    size: 70,
                                                    color: Colors.grey,
                                                  );
                                                },
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null) {
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
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomText(
                                              '${map2['userName'] ?? ""}',
                                              color: Colors.black,
                                            ),
                                            const Spacer(),
                                            const Icon(Icons.chat)
                                          ],
                                        ),
                                      ),
                                    );
                            },
                          );
                        },
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
