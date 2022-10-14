import 'package:firebase_core/firebase_core.dart';
import 'package:flagmodeapp12/screens/auth/splash.dart';
import 'package:flagmodeapp12/widgets/local_storage.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppCache.init();
  await Firebase.initializeApp();
  runApp(const FlagMode());
}

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
