import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flagmodeapp12/widgets/local_storage.dart';
import 'package:flagmodeapp12/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../../models/user_model.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  File? image;
  String? imageUrl;

  @override
  void initState() {
    name.text = AppCache.getUser().name!;
    email.text = AppCache.getUser().email!;
    imageUrl = AppCache.getUser().image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        centerTitle: true,
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
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
        title: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Edit Profile',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(AppColors.white),
              ),
              onPressed: saveProfile,
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
                                  ? CachedNetworkImage(
                                      imageUrl: imageUrl ??
                                          'https://picsum.phommmtos/200',
                                      placeholder: (context, url) =>
                                          Image.asset(
                                              'assets/images/placeholder.png'),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              'assets/images/placeholder.png'),
                                      height: 50,
                                      width: 50,
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
                    name.text,
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
                TextField(
                  controller: name,
                  onChanged: (a) {
                    setState(() {});
                  },
                ),
                Text(
                  'Email Address',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.dudu),
                ),
                SizedBox(height: 4),
                TextField(
                  controller: email,
                  readOnly: true,
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }

  saveProfile() async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("profiles/${AppCache.getUser().uid}");

    if (image != null) {
      UploadTask uploadTask = reference.putFile(image!);
      TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() => null));
      imageUrl = await downloadUrl.ref.getDownloadURL();
    }

    print(imageUrl);

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({"name": name.text, 'image': imageUrl});

    AppCache.saveUser(UserModel(
            name: name.text,
            email: email.text,
            image: imageUrl,
            uid: AppCache.getUser().uid)
        .toJson());
    Utils.showNotif(context, "Profile Updated");
  }
}
