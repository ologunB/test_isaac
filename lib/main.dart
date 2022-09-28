import 'package:flagmodeapp12/screens/auth/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FlagMode());

class FlagMode extends StatelessWidget {
  const FlagMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
