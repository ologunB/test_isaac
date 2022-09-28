import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flutter/material.dart';

class TermsPrivacy extends StatefulWidget {
  const TermsPrivacy({Key? key}) : super(key: key);

  @override
  State<TermsPrivacy> createState() => _TermsPrivacyState();
}

class _TermsPrivacyState extends State<TermsPrivacy> {
  @override
  Widget build(BuildContext context) {
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
                          'Terms and Privacy',
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
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur\n adipiscing elit. Vestibulum mattis fermentum a,\n sit tellus vitae massa. Ut arcu diam libero\n magna tortor purus, erat amet sem. Amet,\n laoreet nulla fringilla turpis feugiat. Fringilla a\n non tellus nisl sed. Sed pulvinar nibh imperdiet\n sed. Mauris, orci, nunc iaculis integer risus\n morbi. Nunc tortor consequat nullam molestie\n felis lorem. Sollicitudin non tincidunt\n ullamcorper pretium, aliquet. Diam in consequat\n laoreet fringilla sit. Ut vulputate ut tincidunt\n fermentum viverra. Quis posuere lorem vitae\n imperdiet enim sit. Sed vestibulum, suspendisse\n bibendum sed magna semper enim. Eleifend\n viverra fringilla lacinia pulvinar lacus, convallis\n tellus in pellentesque.\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Notoserif'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Authorized Users',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'Ante semper fringilla at pellentesque mollis\n congue. Urna sit phasellus a sit pharetra. Amet\n euismod dictumst purus sem est sapien.\n Commodo interdum id gravida mauris elit mi\n donec nec. Sed adipiscing vivamus adipiscing in\n sed lectus lobortis. Pharetra est mattis in sed\n sodales tellus arcu. ed adipiscing vivamus\n adipiscing in sed lectus lobortis. Pharetra est\n mattis Ullamcorper mauris. Urna sit phasellus a sit\n pharetra. Amet euismod dictumst purus sem est sapien.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Decline',
                          style: TextStyle(color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.primaryColor),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
