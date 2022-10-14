import 'package:flagmodeapp12/models/message_model.dart';
import 'package:flagmodeapp12/widgets/chat_textfield.dart';
import 'package:flagmodeapp12/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

import '../styles/colors.dart';

class jamesPage extends StatefulWidget {
  const jamesPage({super.key, required this.index});

  final int index;
  @override
  State<jamesPage> createState() => _jamesPageState();
}

class _jamesPageState extends State<jamesPage> {
  TextEditingController textController = TextEditingController();
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
                padding: const EdgeInsets.all(14.0),
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
                            AssetImage(allUsers[widget.index].image),
                        radius: 20),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allUsers[widget.index].name,
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
