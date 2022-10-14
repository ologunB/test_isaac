import 'package:cached_network_image/cached_network_image.dart';
import 'package:flagmodeapp12/models/user_model.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flagmodeapp12/screens/home/chat_details_page.dart';
import 'package:flutter/material.dart';

class Chatspage extends StatefulWidget {
  const Chatspage({Key? key}) : super(key: key);

  @override
  State<Chatspage> createState() => _ChatspageState();
}

class _ChatspageState extends State<Chatspage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) =>
                  const Padding(
                padding: EdgeInsets.only(left: 50, top: 8, bottom: 8),
                child: Divider(),
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return ChatDetailScreen(user: UserModel());
                      }),
                    );
                  },
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://firebasestorage.googleapis.com/v0/b/testisaac-4c1bf.appspot.com/o/mine.png?alt=media&token=847bcda4-a10b-4ff6-a259-b7e8f9641d26",
                          placeholder: (context, url) =>
                              Image.asset('assets/images/placeholder.png'),
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/images/placeholder.png'),
                          height: 50,
                          width: 50,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'name',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Yesterday',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.primaryColor),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Text(
                                    'Jane: Drinks on me tonight 💃🏽💃🏽💃🏽',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 16,
                                    width: 16,
                                    //  alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        '1',
                                        //textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: AppColors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
