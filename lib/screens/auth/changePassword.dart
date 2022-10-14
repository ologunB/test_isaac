import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flagmodeapp12/widgets/utils.dart';
import 'package:flutter/material.dart';

class ChangePassowrd extends StatefulWidget {
  const ChangePassowrd({Key? key}) : super(key: key);

  @override
  State<ChangePassowrd> createState() => _ChangePassowrdState();
}

class _ChangePassowrdState extends State<ChangePassowrd> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(children: [
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
                        'Change Password',
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
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [Text('Current Password')],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: old1,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
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
                    helperStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [Text('New Password')],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: new1,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
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
                    helperStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [Text('Re enter Password')],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: new2,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    filled: true,
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
                    helperStyle: const TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 223,
          ),
          Card(
            child: ElevatedButton(
              onPressed: changwPassword,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                        : const Text(
                            'Verify',
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
          ),
        ]),
      ),
    );
  }

  bool _isLoading = false;

  final TextEditingController old1 = TextEditingController();
  final TextEditingController new1 = TextEditingController();
  final TextEditingController new2 = TextEditingController();
  void changwPassword() async {
    if (old1.text.isEmpty) {
      Utils.showNotif(context, 'Old Password cannot be empty');
      return;
    }
    if (new1.text.isEmpty) {
      Utils.showNotif(context, 'New Password is empty');
      return;
    }
    if (new1.text != new2.text) {
      Utils.showNotif(context, 'New Passwords are not the same');
      return;
    }

    setState(() {
      _isLoading = true;
    });
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    String email = firebaseAuth.currentUser!.email!;

    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email.trim(), password: old1.text);

      User user = userCredential.user!;
      if (userCredential.user != null) {
        await user.updatePassword(new1.text);
        new1.clear();
        new2.clear();
        old1.clear();

        Utils.showNotif(context, 'Password changes successfully');
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

/* */