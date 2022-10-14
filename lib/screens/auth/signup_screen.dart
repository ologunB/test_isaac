import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagmodeapp12/screens/auth/login_screen.dart';
import 'package:flagmodeapp12/widgets/back_button.dart';
import 'package:flagmodeapp12/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flagmodeapp12/styles/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
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
                  'Create Account',
                  style: TextStyle(
                      fontFamily: 'NotoSerif',
                      fontSize: 36,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Complete the form below to create an account',
                  style: TextStyle(
                    fontFamily: 'NotoSerif',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Name',
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
                  height: 16.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
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
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Password',
                    helperStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 197),
                Row(
                  children: [
                    const SizedBox(
                      width: 10.0,
                    ),
                    Checkbox(
                        activeColor: Colors.grey,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = false;
                          });
                        }),
                    const Center(
                      child: Text(
                        'I agree to the Terms & Conditions and Privacy Policy',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Card(
                  child: ElevatedButton(
                    onPressed: () {
                      createAccount();
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
                                  ),
                                )
                              : const Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                        ],
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isLoading = false;

  void createAccount() async {
    if (fullNameController.text.isEmpty) {
      Utils.showNotif(context, 'Enter full name');
      return;
    }
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
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: email.trim(), password: password);

      if (userCredential.user != null) {
        await userCredential.user?.sendEmailVerification();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'name': fullNameController.text,
          'email': email,
          'uid': userCredential.user?.uid,
        });
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
        Utils.showNotif(
            context, 'An email has been sent to you to verify your account');
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
