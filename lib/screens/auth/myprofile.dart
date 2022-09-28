import 'package:file_picker/file_picker.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Edit Profile',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            width: 83,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                'Done',
                style: TextStyle(
                    color: AppColors.lightgreen,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.white,
      body: ListView(children: [
        Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            Container(
              height: 100,
              margin: const EdgeInsets.only(top: 67),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
            ),
            Positioned(
              top: 30,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: image == null
                                  ? Image.asset(
                                      'assets/images/james.png',
                                      height: 90,
                                      width: 90,
                                    )
                                  : Image.file(
                                      image!,
                                      height: 90,
                                      width: 90,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles(type: FileType.image);
                              if (result != null) {
                                image = File(result.files.single.path!);
                                setState(() {});
                              } else {}
                            },
                            child: Image.asset(
                              'assets/images/select.png',
                              height: 32,
                              width: 32,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'John Stone',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Making money all day everyday. I sell dollars too',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          color: AppColors.primaryColor,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20),
              ),
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.dudu),
                ),
                TextField(),
                Text(
                  'Email Address',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.dudu),
                ),
                SizedBox(height: 4),
                TextField(),
              ],
            ),
          ),
        )
      ]),
    );
  }

  File? image;
}
