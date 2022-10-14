import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagmodeapp12/screens/auth/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/chat_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser != null) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => ChatScreen()),
            (route) => false);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Spacer(),
              const Icon(Icons.flutter_dash, color: Colors.white, size: 60),
              const Spacer(),
              if (FirebaseAuth.instance.currentUser == null)
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                )
            ],
          ),
        ),
      ),
    );
  }
}
