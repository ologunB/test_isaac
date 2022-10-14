import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagmodeapp12/screens/auth/signup_screen.dart';
import 'package:flagmodeapp12/screens/home/chat_screen.dart';
import 'package:flagmodeapp12/widgets/local_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../widgets/utils.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            loginAccount();
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                    : const Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
              ],
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50),
                const Text(
                  'Welcome to\nFlagMode',
                  style: TextStyle(
                      fontFamily: 'NotoSerif',
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Glad you are here',
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 200),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Email',
                    helperStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  obscureText: _obscureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      color: AppColors.darkGrey,
                      onPressed: () {
                        _obscureText = !_obscureText;
                        setState(() {});
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    helperStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ForgetPassword();
                          }),
                        );
                      },
                      child: Text('Forgot Password?'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return SignupScreen();
                          }),
                        );
                      },
                      child: Text('Create Account'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void loginAccount() async {
    if (emailController.text.isEmpty) {
      Utils.showNotif(context, 'Email cannot be empty');
      return;
    }
    if (passwordController.text.isEmpty) {
      Utils.showNotif(context, 'Password is empty');
      return;
    }

    setState(() {
      _isLoading = true;
    });
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String email = emailController.text;
    String password = passwordController.text;
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email.trim(), password: password);

      User user = userCredential.user!;
      if (userCredential.user != null) {
        if (user.emailVerified) {
          DocumentSnapshot documentReference = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

          dynamic data = documentReference.data();

          print(data);

          AppCache.saveName(data['name']);
          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (context) => ChatScreen()),
              (route) => false);
        } else {
          firebaseAuth.signOut();
          Utils.showNotif(context,
              'Your account isnt verified, An email has been sent to you to verify yiur account');
        }
      }
      setState(() {
        _isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      Utils.showNotif(context, e.message!);
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      Utils.showNotif(context, e.toString());
      setState(() {
        _isLoading = false;
      });
    }
  }
}
