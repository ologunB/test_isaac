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

  Map<String, MessageModel> messageList = {};

  @override
  void initState() {
    listStream = dbRef
        .child('Messages/List/${AppCache.getUser().uid}')
        .onValue
        .listen((event) {
      if (event.snapshot.value != null) {
        Map map = event.snapshot.value as Map;
        map.forEach((key, value) {
          messageList[key] = MessageModel.fromJson(value);
        });
      } else {
        messageList.clear();
      }
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
                      MessageModel msg = messageList.values.toList()[index];
                      bool fromMe = msg.fromUid == AppCache.getUser().uid;

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return ChatDetailScreen(
                                user: UserModel(
                                    name: fromMe ? msg.toName : msg.fromName,
                                    uid: fromMe ? msg.toUid : msg.fromUid,
                                    image:
                                        fromMe ? msg.toImage : msg.fromImage),
                              );
                            }),
                          );
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: (fromMe
                                        ? msg.toImage
                                        : msg.fromImage) ??
                                    'https://firebasestorage.googleapis.com/v0/b/testisaac-4c1bf.appspot.com/o/placeholder.png?alt=media&token=38bb61c8-0807-4bfd-84b1-503f97dc9bb4',
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
                                          fromMe ? msg.toName! : msg.fromName!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          parseDate(msg.createdAt),
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: AppColors.primaryColor),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        fromMe
                                            ? Icon(
                                                Icons.done_all,
                                                size: 14,
                                                color: AppColors.primaryColor,
                                              )
                                            : const SizedBox(),
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

  String parseDate(int? timestamp) {
    if (timestamp == null) return '';
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    DateTime now = DateTime.now();

    if (date.difference(now).inSeconds.abs() < 60) {
      return 'Now';
    } else if (date.day == now.day) {
      return '${date.hour}:${date.minute < 10 ? '0' : ''}${date.minute} ${date.hour > 12 ? 'PM' : 'AM'}';
    } else if (date.day == now.day - 1) {
      return 'Yesterday';
    } else if (date.day == now.day - 2) {
      return '2 days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
