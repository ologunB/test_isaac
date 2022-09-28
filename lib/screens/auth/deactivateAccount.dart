import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flutter/material.dart';

class DeactivateAccount extends StatefulWidget {
  const DeactivateAccount({Key? key}) : super(key: key);

  @override
  State<DeactivateAccount> createState() => _DeactivateAccountState();
}

class _DeactivateAccountState extends State<DeactivateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(children: [
        const SafeArea(child: SizedBox(height: 6)),
        IntrinsicHeight(
          child: Container(
            //   height: 100,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
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
                      'Deactivate Account',
                      style: TextStyle(color: AppColors.white, fontSize: 20),
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
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              Text(
                'You can either logout of your account for the time being, or Delete completely.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Note: Deleting your account will permanently erase all user data which can’t be recovered.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 150,
        ),
        Spacer(),
        Card(
          child: OutlinedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: AppColors.white,
              side: BorderSide(color: AppColors.red),
            ),
          ),
        ),
        Card(
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Deactivate',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.red),
            ),
          ),
        ),
      ]),
    );
  }
}
