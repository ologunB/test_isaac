import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flagmodeapp12/widgets/chat_textfield.dart';
import 'package:flagmodeapp12/widgets/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../models/message_model.dart';
import '../../models/user_model.dart';
import '../../styles/colors.dart';
import '../../widgets/utils.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key, required this.user});

  final UserModel user;
  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  StreamSubscription<bool>? keyboardStream;
  StreamSubscription? listStream;

  List<MessageModel> messageList = [];

  @override
  initState() {
    super.initState();

    String id = Utils.generateId(AppCache.getUser().uid, widget.user.uid);
    listStream =
        dbRef.child('Messages/Messages/$id/').onChildAdded.listen((event) {
      print(event.snapshot);
      messageList.add(MessageModel.fromJson(event.snapshot.value));
      setState(() {});
      if (scrollController.hasClients)
        scrollController.animateTo(
            scrollController.position.maxScrollExtent + 400,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300));
    });

    KeyboardVisibilityController keyboardVisibilityController =
        KeyboardVisibilityController();

    keyboardStream =
        keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        scrollController.animateTo(
          scrollController.position.minScrollExtent - 600,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300),
        );
      }
    });
  }

  @override
  void dispose() {
    keyboardStream?.cancel();
    listStream?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: FooterLayout(
        footer: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ChatTextField(
            textController: textController,
            sendButtonColor: AppColors.primaryColor,
            onSend: (a) {
              onSendMessage();
            },
          ),
        ),
        child: Column(children: [
          const SafeArea(
            child: SizedBox(height: 6),
          ),
          IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 14,
                        color: AppColors.white,
                      ),
                    ),
                    CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/placeholder.png'),
                        radius: 20),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.name ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          'online',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.info,
                          color: AppColors.lightGrey,
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: AppColors.primaryColor,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: RotatedBox(
                quarterTurns: 2,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: ListView.builder(
                    itemCount: messageList.length,
                    shrinkWrap: true,
                    reverse: true,
                    controller: scrollController,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      MessageModel msg = messageList[index];

                      bool fromMe = msg.fromUid == AppCache.getUser().uid;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: BubbleNormal(
                            text: msg.text!,
                            isSender: fromMe,
                            color: fromMe
                                ? AppColors.primaryColor
                                : AppColors.lightGrey,
                            tail: true,
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 16,
                                color: fromMe ? Colors.white : Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();

  onSendMessage() {
    int now = DateTime.now().microsecondsSinceEpoch;

    UserModel fromUser = AppCache.getUser();
    UserModel toUser = widget.user;

    String messageId = Utils.generateId(toUser.uid, fromUser.uid);

    Map<String, dynamic> data = {
      'text': textController.text,
      'created_at': now,
      'from_uid': fromUser.uid,
      'from_name': fromUser.name,
      'from_image': fromUser.image,
      'to_uid': toUser.uid,
      'to_name': toUser.name,
      'to_image': toUser.image,
    };

    dbRef.child('Messages/List/${fromUser.uid}/${toUser.uid}').set(data);
    dbRef.child('Messages/List/${toUser.uid}/${fromUser.uid}').set(data);
    dbRef.child('Messages/Messages/$messageId').push().set(data);
  }
}
