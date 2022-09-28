import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flutter/material.dart';

class ChangePassowrd extends StatefulWidget {
  const ChangePassowrd({Key? key}) : super(key: key);

  @override
  State<ChangePassowrd> createState() => _ChangePassowrdState();
}

class _ChangePassowrdState extends State<ChangePassowrd> {
  late bool _passwordVisble;
  @override
  void initState() {
    _passwordVisble = false;
    super.initState();
  }

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
                  obscureText: _passwordVisble,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      color: AppColors.darkGrey,
                      onPressed: () {
                        _passwordVisble = !_passwordVisble;
                        setState(() {});
                      },
                      icon: Icon(_passwordVisble
                          ? Icons.visibility_off
                          : Icons.visibility),
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
                  obscureText: _passwordVisble,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      color: AppColors.darkGrey,
                      onPressed: () {
                        _passwordVisble = !_passwordVisble;
                        setState(() {});
                      },
                      icon: Icon(_passwordVisble
                          ? Icons.visibility_off
                          : Icons.visibility),
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
                  obscureText: _passwordVisble,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: IconButton(
                      color: AppColors.darkGrey,
                      onPressed: () {
                        _passwordVisble = !_passwordVisble;
                        setState(() {});
                      },
                      icon: Icon(_passwordVisble
                          ? Icons.visibility_off
                          : Icons.visibility),
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
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
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
}
