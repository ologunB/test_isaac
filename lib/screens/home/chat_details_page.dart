import 'package:flagmodeapp12/widgets/chat_textfield.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

import '../../models/user_model.dart';
import '../../styles/colors.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key, required this.user});

  final UserModel user;
  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: FooterLayout(
        footer: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ChatTextField(
            textController: textController,
            sendButtonColor: AppColors.primaryColor,
            onSend: (a) {
              scrollController.animateTo(
                  scrollController.position.maxScrollExtent + 20,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300));
              print(a);
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
                FocusScope.of(context).requestFocus(
                  new FocusNode(),
                );
              },
              child: ListView.builder(
                itemCount: 18,
                shrinkWrap: true,
                controller: scrollController,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BubbleNormal(
                      text:
                          'Oh yeah, i got those yesterday. Already started working on the project. Hope we can have a meeting today,',
                      isSender: index.isEven,
                      color: index.isOdd
                          ? AppColors.lightGrey
                          : AppColors.primaryColor,
                      tail: true,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: index.isOdd ? Colors.black : AppColors.white),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
