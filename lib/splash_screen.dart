import 'package:flutter/material.dart';
import 'package:inputdata/pages/mainNavigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  goToMain() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainNavigation(),
      ),
    );
  }

  @override
  void initState() {
    goToMain();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 90,
              child: Image.asset("assets/logo.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
