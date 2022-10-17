import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flagmodeapp12/models/user_model.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flagmodeapp12/screens/home/chat_details_page.dart';
import 'package:flagmodeapp12/widgets/local_storage.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class Chatspage extends StatefulWidget {
  const Chatspage({Key? key}) : super(key: key);

  @override
  State<Chatspage> createState() => _ChatspageState();
}

class _ChatspageState extends State<Chatspage> {
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  StreamSubscription? listStream;

  List<MessageModel> messageList = [];

  @override
  void initState() {
    listStream = dbRef
        .child('Messages/List/${AppCache.getUser().uid}')
        .onChildAdded
        .listen((event) {
      messageList.add(MessageModel.fromJson(event.snapshot.value));
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    listStream?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        messageList.isEmpty
            ? Text('No message, Create one')
            : Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: messageList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Padding(
                      padding: EdgeInsets.only(left: 50, top: 8, bottom: 8),
                      child: Divider(),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      MessageModel msg = messageList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ChatDetailScreen(
                                user:
                                    UserModel(name: msg.toName, uid: msg.toUid),
                              );
                            }),
                          );
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: msg.toImage ?? 'cc',
                                placeholder: (context, url) => Image.asset(
                                    'assets/images/placeholder.png'),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                        'assets/images/placeholder.png'),
                                height: 50,
                                width: 50,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          msg.toName!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          'Yesterday',
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        Text(
                                          msg.text!,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 16,
                                          width: 16,
                                          //  alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Center(
                                            child: Text(
                                              '1',
                                              //textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: AppColors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
