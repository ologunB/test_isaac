import 'dart:io';

import 'package:flagmodeapp12/screens/auth/congratscreen.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class BusinessDetails extends StatefulWidget {
  const BusinessDetails({Key? key}) : super(key: key);

  @override
  State<BusinessDetails> createState() => _BusinessDetailsState();
}

class _BusinessDetailsState extends State<BusinessDetails> {
  TextEditingController name = TextEditingController();
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
                            'Register Your Business',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Business Details',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Name of Business',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SingleChildScrollView(
                      child: TextField(
                        controller: name,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'What name are you giving your Business?',
                          hintStyle: TextStyle(color: AppColors.darkGrey),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        filled: true,
                        hintText:
                            'What kind of service does your business offer?',
                        hintStyle: TextStyle(color: AppColors.darkGrey),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Category',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.chevron_right,
                          color: AppColors.darkGrey,
                        ),
                        filled: true,
                        hintText: 'Choose a category',
                        hintStyle: TextStyle(color: AppColors.darkGrey),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text('Contact Details'),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text('Address'),
                    const SizedBox(
                      height: 4,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          filled: true,
                          hintText: 'Where is your business located?',
                          hintStyle: TextStyle(color: AppColors.darkGrey)),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Text('Phone'),
                    const SizedBox(
                      height: 4,
                    ),
                    const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          filled: true,
                          hintText: 'Phone number of your business?'),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Text(
                      'Upload Images',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(type: FileType.image);

                            if (result != null) {
                              file = File(result.files.single.path!);
                              setState(() {});
                            } else {
                              // User canceled the picker
                            }
                          },
                          child: DottedBorder(
                            radius: const Radius.circular(12),
                            color: AppColors.primaryColor,
                            dashPattern: const [7, 7],
                            strokeWidth: 1,
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset(
                                'assets/images/cloud.png',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        if (file != null)
                          Image.file(
                            file!,
                            width: 50,
                          )
                      ],
                    ),
                    const SizedBox(height: 4),
                    Card(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const CongratScreen();
                            }),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Register Business',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.primaryColor)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  File? file;
}
