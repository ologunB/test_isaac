import 'package:flagmodeapp12/styles/colors.dart';
import 'package:flutter/material.dart';

class CongratScreen extends StatefulWidget {
  const CongratScreen({Key? key}) : super(key: key);

  @override
  State<CongratScreen> createState() => _CongratScreenState();
}

class _CongratScreenState extends State<CongratScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/congrat.png',
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Card(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Close',
                          style: TextStyle(color: AppColors.lightgreen),
                        ),
                      ],
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
