import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagmodeapp12/screens/auth/login_screen.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flagmodeapp12/widgets/utils.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        title: Text('Resets Passwords'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Receive an email to reset your password.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: AppColors.primaryColor),
              icon: Icon(
                Icons.email_outlined,
              ),
              label: _isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                  : Text(
                      'Reset Passowrd',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
              onPressed: () {
                resetPassword();
              },
            ),
          ],
        ),
      ),
    );
  }

  final emailController = TextEditingController();
  bool _isLoading = false;
  void resetPassword() async {
    if (emailController.text.isEmpty) {
      Utils.showNotif(context, 'Email cannot be empty');
      return;
    }

    setState(() {
      _isLoading = true;
    });
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String email = emailController.text;
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email.trim());

      Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => LoginScreen()),
          (route) => false);
      Utils.showNotif(context, 'An email has been sent to you');

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
