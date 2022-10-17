import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagmodeapp12/screens/auth/settings.dart';
import 'package:flagmodeapp12/screens/auth/splash.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flagmodeapp12/widgets/chats_page.dart';
import 'package:flagmodeapp12/widgets/groups_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/myprofile.dart';
import 'choose_user_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _currentPage = 0;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext _) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.create,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => const ChooseUserScreen()));
        },
      ),
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Flagmode.png', height: 33),
              ],
            ),
          ),
          leadingWidth: 500,
          elevation: 0,
          backgroundColor: AppColors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              ),
              color: Colors.black,
              iconSize: 30.0,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_camera_front_rounded,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: PopupMenuButton<int>(
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                  onSelected: (int a) async {
                    if (a == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyProfile(),
                        ),
                      );
                    }
                    if (a == 5) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Settings(),
                        ),
                      );
                    }
                    if (a == 10) {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => SplashScreen()),
                          (route) => false);
                    }
                  },
                  itemBuilder: (BuildContext cContext) => <PopupMenuEntry<int>>[
                        const PopupMenuItem<int>(
                          value: 0,
                          child: Text('Add Business'),
                        ),
                        const PopupMenuItem<int>(
                          value: 1,
                          child: Text('My Profile'),
                        ),
                        const PopupMenuItem<int>(
                          value: 4,
                          child: Text('Invite Nigerians'),
                        ),
                        const PopupMenuItem<int>(
                          value: 5,
                          child: Text('Settings'),
                        ),
                        const PopupMenuItem<int>(
                          value: 10,
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ]),
            ),
          ]),
      body: Column(
        children: [
          Container(
            color: AppColors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: AppColors.primaryColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Places & Services Nearby',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.white),
                      ),
                      const Spacer(),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            fontSize: 12,
                            color: AppColors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        10,
                        (index) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Chip(
                            label: Text(
                              'Hospital',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.primaryColor),
                            ),
                            backgroundColor: AppColors.white,
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50),
                ),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.lightGrey,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            _controller.animateToPage(0,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.linear);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 8),
                            child: Text(
                              ' Chats ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: _currentPage == 0
                                    ? AppColors.white
                                    : AppColors.darkGrey,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: _currentPage == 0
                                  ? AppColors.primaryColor
                                  : AppColors.lightGrey,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _controller.animateToPage(1,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.linear);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 8),
                            child: Text(
                              'Groups',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: _currentPage == 1
                                    ? AppColors.white
                                    : AppColors.darkGrey,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: _currentPage == 1
                                  ? AppColors.primaryColor
                                  : AppColors.lightGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _controller,
                      onPageChanged: (a) {
                        _currentPage = a;
                        setState(() {});
                      },
                      children: const [
                        Chatspage(),
                        GroupsPage(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
