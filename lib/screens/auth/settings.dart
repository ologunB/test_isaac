import 'package:flagmodeapp12/screens/auth/changePassword.dart';
import 'package:flagmodeapp12/screens/auth/changelocation.dart';
import 'package:flagmodeapp12/screens/auth/changenumber.dart';
import 'package:flagmodeapp12/screens/auth/contactUs.dart';
import 'package:flagmodeapp12/screens/auth/deactivateAccount.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flutter/material.dart';

import 'Terms.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SafeArea(child: SizedBox(height: 6)),
            IntrinsicHeight(
              child: Container(
                //   height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Stack(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 14,
                            color: AppColors.white,
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Settings',
                          style:
                              TextStyle(color: AppColors.white, fontSize: 20),
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
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ContactUs();
                      }));
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.lightGrey,
                          radius: 28,
                          child: Icon(
                            Icons.person,
                            size: 30,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            InkWell(
                              child: Text(
                                'Contact Us',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Having difficulties? Lets help you out',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 77, top: 5, bottom: 5, right: 19),
                  child: Divider(),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const TermsPrivacy();
                  }),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      radius: 28,
                      child: Icon(
                        Icons.privacy_tip_sharp,
                        size: 30,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Terms and Privacy policy',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Contracts and Legal ',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 77, top: 5, bottom: 5, right: 19),
              child: Divider(),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ChangePassowrd();
                  }),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      radius: 28,
                      child: Icon(
                        Icons.vpn_key,
                        size: 30,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Change Password',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Buff up your security',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 77, top: 5, bottom: 5, right: 19),
              child: Divider(),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ChangeNumber();
                  }),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      radius: 28,
                      child: Icon(
                        Icons.phone,
                        size: 30,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Change Phone Number',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Set your new number here',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 77, top: 5, bottom: 5, right: 19),
              child: Divider(),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const ChangeLocation();
                  }),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      radius: 28,
                      child: Icon(
                        Icons.send,
                        size: 30,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Update Location',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Country, Province',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 77, top: 5, bottom: 5, right: 19),
              child: Divider(),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const DeactivateAccount();
                  }),
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: CircleAvatar(
                      backgroundColor: AppColors.lightGrey,
                      radius: 28,
                      child: const Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Deactivate Account',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Log Out, Delete Account',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 77, top: 5, bottom: 5, right: 19),
              child: Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
