import 'package:flagmodeapp12/screens/home/chat_details_page.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class ChooseUserScreen extends StatefulWidget {
  const ChooseUserScreen({Key? key}) : super(key: key);

  @override
  State<ChooseUserScreen> createState() => _ChooseUserScreenState();
}

class _ChooseUserScreenState extends State<ChooseUserScreen> {
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
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text('User $i'),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailScreen(index: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}
