import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagmodeapp12/screens/home/chat_details_page.dart';
import 'package:flutter/material.dart';

import '../../models/user_model.dart';
import '../../styles/colors.dart';

class ChooseUserScreen extends StatefulWidget {
  const ChooseUserScreen({Key? key}) : super(key: key);

  @override
  State<ChooseUserScreen> createState() => _ChooseUserScreenState();
}

class _ChooseUserScreenState extends State<ChooseUserScreen> {
  List<UserModel> users = [];
  @override
  initState() {
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        UserModel user = UserModel.fromJson(element.data());
        users.add(user);
      });
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
                  Text(
                    'Choose User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: users.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemBuilder: (context, i) {
              UserModel user = users[i];
              if (user.uid == FirebaseAuth.instance.currentUser!.uid) {
                return SizedBox();
              }
              return ListTile(
                title: Text(user.name!),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatDetailScreen(user: user),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}
